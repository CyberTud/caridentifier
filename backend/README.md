# Car Identifier Backend

Node.js/Express backend server that provides a secure proxy to OpenAI's Vision API for car identification.

## Features

- **Secure API Proxy**: Keeps your OpenAI API key safe on the server
- **Rate Limiting**: Prevents abuse with configurable limits
- **File Validation**: Validates image uploads (size, type)
- **Error Handling**: Comprehensive error handling and logging
- **CORS Support**: Configurable CORS for frontend integration
- **Multi-format Support**: Accepts both multipart and base64 image uploads

## API Endpoints

### POST `/analyze-image`
Upload an image via multipart form data.

### POST `/analyze-image-base64`
Upload an image as base64 encoded JSON.

### GET `/health`
Health check endpoint.

## Quick Start

1. Install dependencies:
```bash
npm install
```

2. Configure environment:
```bash
cp .env.example .env
# Edit .env and add your OpenAI API key
```

3. Start development server:
```bash
npm run dev
```

4. Start production server:
```bash
npm start
```

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `OPENAI_API_KEY` | Your OpenAI API key | Required |
| `PORT` | Server port | 3000 |
| `NODE_ENV` | Environment mode | development |
| `RATE_LIMIT_WINDOW_MS` | Rate limit window in ms | 900000 |
| `RATE_LIMIT_MAX_REQUESTS` | Max requests per window | 100 |
| `MAX_FILE_SIZE_MB` | Max upload size in MB | 10 |

## Deployment

The server can be deployed to any Node.js hosting platform:

- Vercel
- Heroku
- Railway
- DigitalOcean App Platform
- AWS Elastic Beanstalk

## Security Features

- Input validation and sanitization
- File type and size restrictions
- Rate limiting per IP
- Secure headers with Helmet
- No logging of sensitive data
- Environment-based configuration