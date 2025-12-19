@echo off
echo 🚀 VoiceTask Manager - Backend Deployment to Heroku
echo.

echo Checking if Heroku CLI is installed...
heroku --version
if %errorlevel% neq 0 (
    echo ❌ Heroku CLI not found. Please install it from: https://devcenter.heroku.com/articles/heroku-cli
    pause
    exit /b 1
)

echo.
echo 🔐 Logging into Heroku...
heroku login

echo.
echo 🏗️ Creating Heroku app (or using existing)...
set APP_NAME=voicetask-api-%RANDOM%
heroku create %APP_NAME%
if %errorlevel% neq 0 (
    echo App creation failed, trying with different name...
    set APP_NAME=voicetask-backend-%RANDOM%
    heroku create %APP_NAME%
)

echo.
echo ⚙️ Setting environment variables...
heroku config:set MONGODB_URI="mongodb+srv://taskadmin:taskadmin123@voicetaskcluster.uknbg0k.mongodb.net/voicetask?retryWrites=true&w=majority&appName=VoiceTaskCluster" -a %APP_NAME%
heroku config:set JWT_SECRET="VoiceTask2024SecureJWTSecret32CharsMinimum!@#$%^&*()" -a %APP_NAME%
heroku config:set NODE_ENV="production" -a %APP_NAME%
heroku config:set FRONTEND_URL="https://voicetask-manager.netlify.app" -a %APP_NAME%

echo.
echo 📁 Navigating to backend directory...
cd backend

echo.
echo 📦 Initializing git repository...
git init
git add .
git commit -m "Initial backend deployment"

echo.
echo 🚀 Deploying to Heroku...
heroku git:remote -a %APP_NAME%
git push heroku main

echo.
echo ✅ Backend deployment complete!
echo 🌐 Your API is available at: https://%APP_NAME%.herokuapp.com
echo 🎯 GraphQL endpoint: https://%APP_NAME%.herokuapp.com/graphql
echo.
echo 📝 IMPORTANT: Save this URL for frontend deployment:
echo https://%APP_NAME%.herokuapp.com
echo.
echo Next steps:
echo 1. Copy the API URL above
echo 2. Deploy frontend to Netlify using deploy-frontend.bat
echo 3. Update FRONTEND_URL with actual Netlify URL
echo.
pause