import dotenv from 'dotenv';
import OpenAI from 'openai';
import logger from '../utils/logger.js';

// Load environment variables
dotenv.config();

// Initialize OpenAI client
const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
});

/**
 * System prompt for the LLM (use verbatim as specified)
 */
const SYSTEM_PROMPT = `You are CarVision, a meticulous automotive identifier. Given ONE car photo and optional hints, output STRICT JSON only.
Infer probable make, model, generation, year range, and trim candidates. Estimate confidence.
Add key specs (engine types typically offered, drivetrain, body style), price estimates (new MSRP when launched, current used market values by condition), quick history notes, common maintenance watchouts, and 3-6 similar models with short reasons.
For pricing, provide realistic ranges based on the specific year and trim. Include new MSRP and used market values (fair, good, excellent condition).
If uncertain, say so and lower confidence. NEVER hallucinate unavailable details.`;

/**
 * Expected JSON schema for the response
 */
const EXPECTED_SCHEMA = {
  make: "string",
  model: "string",
  generation: "string|null",
  year_range: "string",
  body_style: "string",
  trim_candidates: [{ name: "string", confidence: 0.0 }],
  confidence: 0.0,
  key_specs: {
    engine_options: ["string"],
    drivetrain: ["string"],
    transmission: ["string"]
  },
  price_estimates: {
    new_msrp: "string (e.g., '$35,000 - $42,000')",
    used_fair: "string (e.g., '$18,000 - $25,000')",
    used_good: "string (e.g., '$22,000 - $30,000')",
    used_excellent: "string (e.g., '$28,000 - $38,000')",
    market_insights: "string (brief market analysis)"
  },
  notable_history: ["string"],
  maintenance_tips: ["string"],
  similar_models: [{ name: "string", why: "string" }],
  disclaimer: "string"
};

/**
 * Analyzes a car image using OpenAI's vision model
 * @param {string} imageBase64 - Base64 encoded image
 * @param {string} hint - Optional hint about the car
 * @returns {Promise<Object>} - Car analysis result
 */
export async function analyzeCarImage(imageBase64, hint = '') {
  try {
    // Construct user message
    let userContent = [
      {
        type: "image_url",
        image_url: {
          url: `data:image/jpeg;base64,${imageBase64}`,
          detail: "high"
        }
      }
    ];

    // Add hint if provided
    if (hint && hint.trim()) {
      userContent.push({
        type: "text",
        text: `Hints: ${hint.trim()}`
      });
    }

    // Add schema instruction
    userContent.push({
      type: "text",
      text: `Return ONLY valid JSON with these exact fields:

${JSON.stringify(EXPECTED_SCHEMA, null, 2)}

No extra keys, no prose. Return ONLY the JSON object.`
    });

    logger.info('Sending request to OpenAI Vision API');

    const response = await openai.chat.completions.create({
      model: "gpt-4o", // Using GPT-4 Omni which supports vision (GPT-5 not yet available)
      messages: [
        {
          role: "system",
          content: SYSTEM_PROMPT
        },
        {
          role: "user",
          content: userContent
        }
      ],
      max_tokens: 2000,
      temperature: 0.1, // Low temperature for consistent results
    });

    const content = response.choices[0]?.message?.content;

    if (!content) {
      throw new Error('No response content from OpenAI API');
    }

    logger.debug('Raw OpenAI response:', content);

    // Parse the JSON response
    let analysisData;
    try {
      // Try to extract JSON from the response (in case there's extra text)
      const jsonMatch = content.match(/\{[\s\S]*\}/);
      const jsonString = jsonMatch ? jsonMatch[0] : content;
      analysisData = JSON.parse(jsonString);
    } catch (parseError) {
      logger.error('Failed to parse JSON response:', {
        error: parseError.message,
        rawContent: content
      });
      throw new Error('Invalid JSON response from vision model');
    }

    // Validate required fields
    const requiredFields = ['make', 'model', 'year_range', 'body_style', 'confidence'];
    for (const field of requiredFields) {
      if (!analysisData[field]) {
        throw new Error(`Missing required field: ${field}`);
      }
    }

    // Ensure confidence is a number between 0 and 1
    if (typeof analysisData.confidence !== 'number' ||
        analysisData.confidence < 0 ||
        analysisData.confidence > 1) {
      analysisData.confidence = Math.max(0, Math.min(1, parseFloat(analysisData.confidence) || 0.5));
    }

    // Ensure arrays exist with defaults
    analysisData.trim_candidates = analysisData.trim_candidates || [];
    analysisData.notable_history = analysisData.notable_history || [];
    analysisData.maintenance_tips = analysisData.maintenance_tips || [];
    analysisData.similar_models = analysisData.similar_models || [];

    // Ensure key_specs object exists with all required arrays
    if (!analysisData.key_specs) {
      analysisData.key_specs = {
        engine_options: [],
        drivetrain: [],
        transmission: []
      };
    } else {
      // Ensure each array field exists in key_specs
      analysisData.key_specs.engine_options = analysisData.key_specs.engine_options || [];
      analysisData.key_specs.drivetrain = analysisData.key_specs.drivetrain || [];
      analysisData.key_specs.transmission = analysisData.key_specs.transmission || [];
    }

    // Ensure price_estimates object exists with all required fields
    if (!analysisData.price_estimates) {
      analysisData.price_estimates = {
        new_msrp: "Price data unavailable",
        used_fair: "Price data unavailable",
        used_good: "Price data unavailable",
        used_excellent: "Price data unavailable",
        market_insights: "Contact local dealers for current market pricing"
      };
    } else {
      // Ensure each field exists in price_estimates
      analysisData.price_estimates.new_msrp = analysisData.price_estimates.new_msrp || "Price data unavailable";
      analysisData.price_estimates.used_fair = analysisData.price_estimates.used_fair || "Price data unavailable";
      analysisData.price_estimates.used_good = analysisData.price_estimates.used_good || "Price data unavailable";
      analysisData.price_estimates.used_excellent = analysisData.price_estimates.used_excellent || "Price data unavailable";
      analysisData.price_estimates.market_insights = analysisData.price_estimates.market_insights || "Contact local dealers for current market pricing";
    }

    // Provide default disclaimer if missing
    if (!analysisData.disclaimer) {
      analysisData.disclaimer = 'Analysis based on visual identification. Verify specific trim and year details. Price estimates are approximate.';
    }

    logger.info('Successfully analyzed car image', {
      make: analysisData.make,
      model: analysisData.model,
      confidence: analysisData.confidence
    });

    return analysisData;

  } catch (error) {
    logger.error('Error in analyzeCarImage:', {
      error: error.message,
      stack: error.stack
    });

    // Re-throw with more specific error messages
    if (error.code === 'insufficient_quota') {
      throw new Error('OpenAI API quota exceeded');
    }

    if (error.code === 'rate_limit_exceeded') {
      throw new Error('OpenAI API rate limit exceeded');
    }

    if (error.message.includes('API key')) {
      throw new Error('Invalid OpenAI API key');
    }

    throw error;
  }
}