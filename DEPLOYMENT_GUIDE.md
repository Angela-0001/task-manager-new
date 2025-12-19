# 🚀 VoiceTask Manager Deployment Guide

## Overview
This guide will help you deploy your VoiceTask Manager application to production using Netlify (frontend) and Heroku (backend).

---

## 📋 Prerequisites

Before deploying, ensure you have:
- ✅ GitHub account with your project repository
- ✅ Netlify account (free tier available)
- ✅ Heroku account (free tier available)
- ✅ MongoDB Atlas account (free tier available)
- ✅ Your project code committed to GitHub

---

## 🗄️ Step 1: Setup MongoDB Atlas (Database)

### 1.1 Create MongoDB Atlas Cluster
1. Go to [MongoDB Atlas](https://www.mongodb.com/atlas)
2. Sign up/Login and create a new project
3. Click "Build a Database" → Choose "FREE" tier
4. Select a cloud provider and region (choose closest to your users)
5. Name your cluster (e.g., "voicetask-cluster")
6. Click "Create Cluster"

### 1.2 Configure Database Access
1. Go to "Database Access" in left sidebar
2. Click "Add New Database User"
3. Choose "Password" authentication
4. Create username/password (save these!)
5. Set privileges to "Read and write to any database"
6. Click "Add User"

### 1.3 Configure Network Access
1. Go to "Network Access" in left sidebar
2. Click "Add IP Address"
3. Choose "Allow Access from Anywhere" (0.0.0.0/0)
4. Click "Confirm"

### 1.4 Get Connection String
1. Go to "Database" → Click "Connect" on your cluster
2. Choose "Connect your application"
3. Copy the connection string (looks like: `mongodb+srv://username:<password>@cluster.mongodb.net/`)
4. Replace `<password>` with your actual password
5. Add database name at the end: `mongodb+srv://username:password@cluster.mongodb.net/voicetask`

---

## 🖥️ Step 2: Deploy Backend to Heroku

### 2.1 Prepare Backend for Deployment

First, update your `backend/package.json`:

```json
{
  "name": "voicetask-backend",
  "version": "1.0.0",
  "description": "VoiceTask Manager GraphQL API",
  "main": "server.js",
  "scripts": {
    "start": "node server.js",
    "dev": "nodemon server.js",
    "test": "echo \"No tests yet\" && exit 0"
  },
  "engines": {
    "node": "18.x",
    "npm": "9.x"
  },
  "dependencies": {
    "apollo-server-express": "^3.13.0",
    "bcryptjs": "^3.0.3",
    "cors": "^2.8.5",
    "dotenv": "^17.2.3",
    "express": "^4.18.0",
    "graphql": "^16.12.0",
    "graphql-upload": "^15.0.2",
    "jsonwebtoken": "^9.0.3",
    "mongoose": "^9.0.1",
    "multer": "^2.0.2"
  },
  "devDependencies": {
    "nodemon": "^3.1.11"
  }
}
```

### 2.2 Create Procfile
Create `backend/Procfile` (no extension):
```
web: node server.js
```

### 2.3 Update server.js for Production
Ensure your `backend/server.js` uses environment PORT:
```javascript
const PORT = process.env.PORT || 5014;
app.listen(PORT, () => {
  console.log(`🚀 Server running at http://localhost:${PORT}`);
});
```

### 2.4 Deploy to Heroku

#### Option A: Using Heroku CLI
1. Install [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
2. Login: `heroku login`
3. Navigate to backend folder: `cd backend`
4. Create Heroku app: `heroku create voicetask-api`
5. Set environment variables:
   ```bash
   heroku config:set MONGODB_URI="your_mongodb_atlas_connection_string"
   heroku config:set JWT_SECRET="your_jwt_secret_here"
   heroku config:set NODE_ENV="production"
   heroku config:set FRONTEND_URL="https://your-netlify-app.netlify.app"
   ```
6. Deploy: `git push heroku main`

#### Option B: Using Heroku Dashboard
1. Go to [Heroku Dashboard](https://dashboard.heroku.com/)
2. Click "New" → "Create new app"
3. Name: `voicetask-api` (or available name)
4. Choose region and click "Create app"
5. Go to "Deploy" tab → Connect to GitHub
6. Search and connect your repository
7. Choose branch (main/master) and enable automatic deploys
8. Go to "Settings" tab → "Config Vars"
9. Add these environment variables:
   - `MONGODB_URI`: Your MongoDB Atlas connection string
   - `JWT_SECRET`: A secure random string
   - `NODE_ENV`: production
   - `FRONTEND_URL`: https://your-netlify-app.netlify.app (you'll update this later)
10. Go back to "Deploy" tab and click "Deploy Branch"

### 2.5 Test Backend Deployment
- Your API will be available at: `https://voicetask-api.herokuapp.com`
- Test GraphQL endpoint: `https://voicetask-api.herokuapp.com/graphql`

---

## 🌐 Step 3: Deploy Frontend to Netlify

### 3.1 Prepare Frontend for Deployment

Update `frontend/.env.production`:
```env
VITE_BACKEND_URL=https://voicetask-api.herokuapp.com
VITE_LLM_ENDPOINT=http://localhost:11434/api/generate
VITE_LLM_MODEL=llama3.2:3b
# Add your API keys if using cloud AI
# VITE_GROQ_API_KEY=your_groq_key
# VITE_GEMINI_API_KEY=your_gemini_key
```

### 3.2 Update Build Configuration
Ensure `frontend/vite.config.js` is configured for production:
```javascript
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  build: {
    outDir: 'dist',
    sourcemap: false,
    rollupOptions: {
      output: {
        manualChunks: {
          vendor: ['react', 'react-dom'],
          apollo: ['@apollo/client'],
          mui: ['@mui/material', '@mui/icons-material']
        }
      }
    }
  },
  server: {
    port: 8082,
    host: true
  }
})
```

### 3.3 Deploy to Netlify

#### Option A: Drag and Drop (Quick)
1. Build your project locally:
   ```bash
   cd frontend
   npm run build
   ```
2. Go to [Netlify](https://netlify.com) and login
3. Drag the `frontend/dist` folder to the deploy area
4. Your site will be deployed with a random URL

#### Option B: Git Integration (Recommended)
1. Go to [Netlify Dashboard](https://app.netlify.com/)
2. Click "New site from Git"
3. Choose GitHub and authorize Netlify
4. Select your repository
5. Configure build settings:
   - **Base directory**: `frontend`
   - **Build command**: `npm run build`
   - **Publish directory**: `frontend/dist`
6. Click "Deploy site"

### 3.4 Configure Environment Variables in Netlify
1. Go to Site Settings → Environment Variables
2. Add your environment variables:
   - `VITE_BACKEND_URL`: https://voicetask-api.herokuapp.com
   - Add any API keys you're using

### 3.5 Update Backend CORS
Update your Heroku backend environment variable:
- `FRONTEND_URL`: https://your-actual-netlify-url.netlify.app

---

## 🔧 Step 4: Final Configuration

### 4.1 Update CORS in Backend
Ensure your backend `server.js` includes your Netlify URL in CORS:
```javascript
app.use(cors({
  origin: [
    process.env.FRONTEND_URL || 'http://localhost:8082',
    'https://your-netlify-app.netlify.app', // Add your actual Netlify URL
    'http://localhost:8081',
    'http://localhost:8082'
  ],
  credentials: true
}));
```

### 4.2 Test Full Application
1. Visit your Netlify URL
2. Test voice commands
3. Verify task creation/editing works
4. Check GraphQL API connectivity

---

## 🎯 Step 5: Custom Domain (Optional)

### 5.1 Netlify Custom Domain
1. Go to Site Settings → Domain Management
2. Click "Add custom domain"
3. Enter your domain (e.g., voicetask.yourdomain.com)
4. Follow DNS configuration instructions

### 5.2 Heroku Custom Domain
1. Go to Heroku app Settings → Domains
2. Click "Add domain"
3. Enter your API domain (e.g., api.yourdomain.com)
4. Configure DNS CNAME record

---

## 🔍 Troubleshooting

### Common Issues:

**Backend not starting:**
- Check Heroku logs: `heroku logs --tail -a voicetask-api`
- Verify MongoDB connection string
- Ensure all environment variables are set

**Frontend can't connect to backend:**
- Check CORS configuration
- Verify VITE_BACKEND_URL is correct
- Check browser network tab for errors

**Voice features not working:**
- HTTPS is required for Web Speech API in production
- Netlify provides HTTPS automatically
- Test in Chrome first (best Web Speech API support)

**Build failures:**
- Check Node.js version compatibility
- Verify all dependencies are in package.json
- Check build logs for specific errors

---

## 📝 Deployment Checklist

- [ ] MongoDB Atlas cluster created and configured
- [ ] Backend deployed to Heroku with environment variables
- [ ] Frontend built and deployed to Netlify
- [ ] CORS configured for production URLs
- [ ] Environment variables set correctly
- [ ] HTTPS working (automatic with Netlify)
- [ ] Voice commands tested in production
- [ ] GraphQL API accessible
- [ ] All features working end-to-end

---

## 🎉 Success!

Your VoiceTask Manager is now live! Share your URLs:
- **Frontend**: https://your-app.netlify.app
- **Backend API**: https://voicetask-api.herokuapp.com/graphql

Remember to update your internship report with the actual deployment URLs once completed!