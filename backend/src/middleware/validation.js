import logger from '../utils/logger.js';

/**
 * Validates image upload middleware
 */
export function validateImageUpload(req, res, next) {
  try {
    // Check if file was uploaded
    if (!req.file) {
      return res.status(400).json({
        error: 'No image provided',
        message: 'Please provide an image file to analyze',
      });
    }

    // Check file size (multer should handle this, but double-check)
    const maxSize = (parseInt(process.env.MAX_FILE_SIZE_MB) || 10) * 1024 * 1024;
    if (req.file.size > maxSize) {
      return res.status(413).json({
        error: 'File too large',
        message: `Image must be smaller than ${maxSize / (1024 * 1024)}MB`,
      });
    }

    // Check file type
    if (!req.file.mimetype.startsWith('image/')) {
      return res.status(400).json({
        error: 'Invalid file type',
        message: 'Only image files are allowed',
      });
    }

    // Log the upload
    logger.debug('Image upload validated', {
      originalName: req.file.originalname,
      mimeType: req.file.mimetype,
      size: req.file.size,
    });

    next();
  } catch (error) {
    logger.error('Error in validateImageUpload:', error);
    res.status(500).json({
      error: 'Validation error',
      message: 'An error occurred while validating the upload',
    });
  }
}

/**
 * Validates request rate limiting
 */
export function validateRateLimit(req, res, next) {
  // This could be enhanced with more sophisticated rate limiting
  // For now, express-rate-limit handles this
  next();
}