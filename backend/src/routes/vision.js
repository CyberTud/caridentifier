import express from 'express';
import multer from 'multer';
import { analyzeCarImage } from '../services/visionService.js';
import { validateImageUpload } from '../middleware/validation.js';
import logger from '../utils/logger.js';

const router = express.Router();

// Configure multer for file uploads
const upload = multer({
  storage: multer.memoryStorage(),
  limits: {
    fileSize: (parseInt(process.env.MAX_FILE_SIZE_MB) || 10) * 1024 * 1024, // 10MB default
  },
  fileFilter: (req, file, cb) => {
    // Check if file is an image
    if (file.mimetype.startsWith('image/')) {
      cb(null, true);
    } else {
      cb(new Error('Only image files are allowed'), false);
    }
  },
});

/**
 * POST /analyze-image
 * Analyzes a car image using LLM Vision
 */
router.post('/analyze-image', upload.single('image'), validateImageUpload, async (req, res) => {
  try {
    const { hint } = req.body;
    const imageBuffer = req.file.buffer;

    logger.info('Starting car analysis', {
      fileSize: imageBuffer.length,
      mimeType: req.file.mimetype,
      hint: hint || 'none',
    });

    // Convert buffer to base64 for OpenAI API
    const imageBase64 = imageBuffer.toString('base64');

    // Analyze the image
    const analysis = await analyzeCarImage(imageBase64, hint);

    logger.info('Car analysis completed successfully', {
      make: analysis.make,
      model: analysis.model,
      confidence: analysis.confidence,
    });

    res.json(analysis);

  } catch (error) {
    logger.error('Error analyzing car image:', {
      error: error.message,
      stack: error.stack,
    });

    if (error.message.includes('rate limit')) {
      return res.status(429).json({
        error: 'Rate limit exceeded',
        message: 'Too many requests. Please try again later.',
      });
    }

    if (error.message.includes('invalid API key')) {
      return res.status(401).json({
        error: 'Authentication error',
        message: 'Invalid API key configuration.',
      });
    }

    if (error.message.includes('timeout')) {
      return res.status(504).json({
        error: 'Request timeout',
        message: 'The analysis request timed out. Please try again.',
      });
    }

    res.status(500).json({
      error: 'Analysis failed',
      message: process.env.NODE_ENV === 'development' ?
        error.message :
        'An error occurred while analyzing the image.',
    });
  }
});

/**
 * POST /analyze-image-base64
 * Alternative endpoint that accepts base64 encoded images in JSON
 */
router.post('/analyze-image-base64', async (req, res) => {
  try {
    const { imageBase64, hint } = req.body;

    if (!imageBase64) {
      return res.status(400).json({
        error: 'Missing image data',
        message: 'imageBase64 field is required',
      });
    }

    logger.info('Starting car analysis (base64)', {
      dataLength: imageBase64.length,
      hint: hint || 'none',
    });

    // Remove data URL prefix if present
    const base64Data = imageBase64.replace(/^data:image\/[a-z]+;base64,/, '');

    // Analyze the image
    const analysis = await analyzeCarImage(base64Data, hint);

    logger.info('Car analysis completed successfully', {
      make: analysis.make,
      model: analysis.model,
      confidence: analysis.confidence,
    });

    res.json(analysis);

  } catch (error) {
    logger.error('Error analyzing car image (base64):', {
      error: error.message,
      stack: error.stack,
    });

    res.status(500).json({
      error: 'Analysis failed',
      message: process.env.NODE_ENV === 'development' ?
        error.message :
        'An error occurred while analyzing the image.',
    });
  }
});

export default router;