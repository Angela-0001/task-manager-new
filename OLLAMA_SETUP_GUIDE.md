# 🚀 Ollama Setup Guide for Enhanced Voice Features

This guide will help you set up Ollama to enable advanced AI-powered voice command parsing in your task manager.

## 📋 What You'll Get

With Ollama installed, your voice commands will be much more intelligent:

- ✅ **Natural language understanding**: "Create a high priority task to buy groceries tomorrow"
- ✅ **Date parsing**: "Schedule meeting next Friday", "Due in 3 days"
- ✅ **Multilingual support**: Mix English with Hindi, Bengali, etc.
- ✅ **Bulk operations**: "Mark all pending tasks as completed"
- ✅ **Context awareness**: References to existing tasks

## 🔧 Installation Steps

### Step 1: Install Ollama

**Option A: Direct Download (Recommended)**
1. Go to https://ollama.com/download
2. Click "Download for Windows"
3. Run the downloaded `OllamaSetup.exe`
4. Follow the installation wizard

**Option B: Using Package Managers**
```powershell
# If you have Chocolatey
choco install ollama

# If you have Scoop
scoop install ollama

# If you have Winget
winget install Ollama.Ollama
```

### Step 2: Start Ollama Service

After installation, open a new PowerShell window and run:

```powershell
ollama serve
```

**Keep this window open** - Ollama needs to run in the background.

### Step 3: Download AI Model

In another PowerShell window, download the recommended model:

```powershell
# Recommended: Small but capable model (2GB)
ollama pull llama3.2:3b

# Alternative: Even smaller model (1GB) if you have limited resources
ollama pull llama3.2:1b
```

### Step 4: Test the Setup

Run our automated setup script:

```powershell
# In your project directory
.\setup-ollama.ps1
```

Or test manually:

```powershell
# Test if Ollama is responding
ollama run llama3.2:3b "Convert this to JSON: create a task to buy milk"
```

## 🧪 Verify Integration

1. **Start your React app** (if not already running):
   ```bash
   cd frontend
   npm run dev
   ```

2. **Check the voice control panel** - you should see:
   - 🧠 "AI Ready" status instead of "Enhanced Fallback"
   - Purple AI button instead of blue basic button

3. **Test voice commands**:
   - Click the voice button
   - Say: "Create a high priority task to buy groceries tomorrow"
   - The AI should understand the priority and due date automatically

## 🔍 Troubleshooting

### "Ollama not available" message

**Check if Ollama is running:**
```powershell
# Test the service
curl http://localhost:11434/api/tags
```

**If not working:**
1. Make sure you ran `ollama serve` in a PowerShell window
2. Check if the model is downloaded: `ollama list`
3. Try restarting: Close Ollama, then run `ollama serve` again

### Model download fails

**If download is slow or fails:**
```powershell
# Try the smaller model
ollama pull llama3.2:1b

# Or check available models
ollama list
```

### Port conflicts

**If port 11434 is busy:**
```powershell
# Start Ollama on different port
set OLLAMA_HOST=0.0.0.0:11435
ollama serve
```

Then update your frontend/.env:
```env
VITE_LLM_ENDPOINT=http://localhost:11435/api/generate
```

## 🎯 Usage Tips

### Best Voice Commands

**Creating tasks:**
- "Create a high priority task to call the doctor tomorrow"
- "Add buy groceries to my list with medium priority"
- "Schedule meeting with team next Friday"

**Managing tasks:**
- "Mark task 1 as completed"
- "Change the priority of buy groceries to high"
- "Delete all completed tasks"

**Bulk operations:**
- "Mark all pending tasks as in progress"
- "Set all tasks due today to high priority"

### Supported Languages

You can mix languages naturally:
- "कल grocery buy करना है urgent" (Hindi + English)
- "আগামীকাল meeting আছে important" (Bengali + English)

## 🔧 Advanced Configuration

### Using Different Models

Edit `frontend/.env`:
```env
# Faster but less capable
VITE_LLM_MODEL=llama3.2:1b

# More capable but slower
VITE_LLM_MODEL=llama3.1:8b
```

### Performance Tuning

For better performance on slower machines:
```env
# Use smaller model
VITE_LLM_MODEL=llama3.2:1b

# Or reduce context
VITE_LLM_MAX_TOKENS=200
```

## 🆘 Need Help?

1. **Run the test script**: `.\test-ollama-voice.ps1`
2. **Check browser console** for detailed error messages
3. **Verify model**: `ollama list` should show your downloaded model
4. **Restart everything**: Close Ollama, restart it, refresh your browser

## 🎉 Success!

When everything is working, you'll see:
- 🧠 "AI Ready" status in the voice control panel
- Purple AI-powered voice button
- Much better understanding of natural voice commands
- Support for dates, priorities, and complex operations

Enjoy your enhanced voice-powered task management! 🎙️✨