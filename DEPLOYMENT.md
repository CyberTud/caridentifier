# Deployment Guide for Car Identifier Backend

## Deploying to Render (Recommended - FREE)

### Step-by-Step Instructions:

1. **Create a Render Account**
   - Go to https://render.com
   - Sign up with GitHub for easier deployment

2. **Connect Your GitHub Repository**
   - Click "New +" → "Web Service"
   - Connect your GitHub account
   - Select the `caridentifier` repository

3. **Configure the Service**
   - **Name**: `car-identifier-backend`
   - **Root Directory**: `backend`
   - **Environment**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Plan**: Select "Free" tier

4. **Add Environment Variables**
   Click "Advanced" and add:
   - `OPENAI_API_KEY`: Your OpenAI API key
   - `NODE_ENV`: `production`
   - `PORT`: `3000`

5. **Deploy**
   - Click "Create Web Service"
   - Wait for deployment (takes 2-3 minutes)
   - Your backend URL will be: `https://car-identifier-backend.onrender.com`

6. **Update Your Flutter App**
   In `lib/application/providers/settings_provider.dart`, update:
   ```dart
   backendUrl: 'https://car-identifier-backend.onrender.com',
   ```

## Alternative: Deploy to Railway

1. **Install Railway CLI**
   ```bash
   npm install -g @railway/cli
   ```

2. **Login and Deploy**
   ```bash
   cd backend
   railway login
   railway init
   railway up
   ```

3. **Add Environment Variables**
   ```bash
   railway variables set OPENAI_API_KEY=your-key-here
   railway variables set NODE_ENV=production
   ```

## Alternative: Deploy to Vercel

1. **Install Vercel CLI**
   ```bash
   npm install -g vercel
   ```

2. **Create vercel.json in backend folder**
   ```json
   {
     "version": 2,
     "builds": [
       {
         "src": "src/server.js",
         "use": "@vercel/node"
       }
     ],
     "routes": [
       {
         "src": "/(.*)",
         "dest": "src/server.js"
       }
     ]
   }
   ```

3. **Deploy**
   ```bash
   cd backend
   vercel
   ```

## Alternative: Deploy to Fly.io

1. **Install Fly CLI**
   ```bash
   curl -L https://fly.io/install.sh | sh
   ```

2. **Initialize and Deploy**
   ```bash
   cd backend
   fly launch
   fly secrets set OPENAI_API_KEY=your-key-here
   fly deploy
   ```

## Important Notes

### Free Tier Limitations:
- **Render**: Spins down after 15 min inactivity (30-60s cold start)
- **Railway**: $5 credit/month (usually enough for low traffic)
- **Vercel**: Serverless functions timeout after 10s on free tier
- **Fly.io**: 3 shared VMs, requires credit card

### Recommended for Production:
For consistent performance without cold starts, consider:
- **Render Paid**: $7/month for always-on
- **Railway Paid**: ~$5-10/month based on usage
- **Google Cloud Run**: Pay per request (very cheap for low traffic)

### Environment Variables to Set:
```env
OPENAI_API_KEY=your-openai-api-key
NODE_ENV=production
PORT=3000
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100
```

### CORS Configuration:
Update `backend/src/server.js` CORS origin for production:
```javascript
cors({
  origin: process.env.NODE_ENV === 'production' ?
    ['https://your-frontend-domain.com'] :
    ['http://localhost:3000', 'http://127.0.0.1:3000'],
})
```

## Testing Your Deployment

Once deployed, test your backend:

```bash
curl -X GET https://your-backend-url.com/health
```

Should return:
```json
{
  "status": "healthy",
  "timestamp": "2024-01-01T00:00:00.000Z",
  "version": "1.0.0"
}
```

## Monitoring

Most platforms provide:
- Real-time logs
- Metrics dashboard
- Alert notifications
- Auto-restart on crash

Access logs on:
- **Render**: Dashboard → Logs
- **Railway**: Dashboard → Deployments → View Logs
- **Vercel**: Dashboard → Functions → Logs
- **Fly.io**: `fly logs`