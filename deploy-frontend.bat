@echo off
echo VoiceTask Manager - Frontend Deployment
echo.

echo Building frontend...
cd frontend
npm install
npm run build

echo.
echo Build complete! Files are in: frontend/dist
echo.
echo Netlify Deployment Options:
echo.
echo Option 1 - Drag & Drop:
echo 1. Go to https://netlify.com
echo 2. Drag the 'frontend/dist' folder to deploy
echo.
echo Option 2 - Git Integration:
echo 1. Go to https://app.netlify.com/
echo 2. Click "New site from Git"
echo 3. Set build directory: frontend
echo 4. Set build command: npm run build
echo 5. Set publish directory: frontend/dist
echo 6. Add environment variables:
echo    - VITE_API_URL: https://your-heroku-app.herokuapp.com/graphql
echo.
pause