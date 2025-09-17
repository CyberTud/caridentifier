import logger from '../utils/logger.js';

/**
 * 404 Not Found handler
 */
export function notFoundHandler(req, res, next) {
  const error = new Error(`Not Found - ${req.originalUrl}`);
  error.status = 404;
  next(error);
}

/**
 * Global error handler
 */
export function errorHandler(err, req, res, next) {
  // Default to 500 server error
  let error = { ...err };
  error.message = err.message;

  // Log error
  logger.error('Error Handler:', {
    message: error.message,
    stack: error.stack,
    url: req.originalUrl,
    method: req.method,
    ip: req.ip,
  });

  // Multer file size error
  if (err.code === 'LIMIT_FILE_SIZE') {
    const message = 'File too large';
    error = { message, status: 413 };
  }

  // Multer file type error
  if (err.message === 'Only image files are allowed') {
    error = { message: err.message, status: 400 };
  }

  // JSON parsing error
  if (err.type === 'entity.parse.failed') {
    const message = 'Invalid JSON';
    error = { message, status: 400 };
  }

  // OpenAI API errors
  if (err.message.includes('OpenAI')) {
    if (err.message.includes('rate limit')) {
      error = { message: 'API rate limit exceeded', status: 429 };
    } else if (err.message.includes('quota')) {
      error = { message: 'API quota exceeded', status: 429 };
    } else if (err.message.includes('API key')) {
      error = { message: 'API authentication failed', status: 401 };
    }
  }

  res.status(error.status || 500).json({
    error: error.message || 'Server Error',
    ...(process.env.NODE_ENV === 'development' && { stack: error.stack }),
  });
}