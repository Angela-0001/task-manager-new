# 🧠 AI-Powered Voice Task Manager

A modern, multilingual task management application with **AI-powered voice command parsing** that understands natural language, supports multiple languages, and provides intelligent task management through voice commands.

## ✨ Features

### 🧠 AI-Powered Voice Commands
- **Natural Language Understanding**: "Add urgent task buy milk tomorrow morning"
- **Multilingual Support**: Hindi, Tamil, Bengali, Marathi, Telugu, and more
- **Code-Mixing**: "kal grocery buy karna urgent", "meeting को complete kar do"
- **Smart Date Parsing**: "tomorrow morning", "next week", "5pm today"
- **Priority Detection**: Automatically detects urgency and importance
- **Task Matching**: "complete the grocery task", "delete meeting wala task"
- **Fallback Mode**: Basic voice control when AI is unavailable

### 🌍 Multilingual Voice Support
- **English**: Full natural language processing
- **Hindi (हिन्दी)**: "कल डॉक्टर के पास जाना है"
- **Tamil (தமிழ்)**: "நாளை காலை மீட்டிங்"
- **Bengali (বাংলা)**: Native voice command support
- **Code-Mixing**: Seamless switching between languages
- **10+ Indian Languages**: Complete multilingual ecosystem

### 📅 Enhanced Task Management
- **Due Dates**: Set and track task deadlines
- **Priority Levels**: Low, Medium, High priority tasks
- **Status Tracking**: Pending, In Progress, Completed
- **Overdue Indicators**: Visual warnings for overdue tasks
- **Smart Sorting**: Tasks sorted by due date and priority

### ♿ Full Accessibility Support
- **Screen Reader Compatible**: Complete ARIA labels and descriptions
- **Keyboard Navigation**: Full keyboard support with shortcuts
- **Focus Management**: Proper focus handling throughout the app
- **Voice Feedback**: Text-to-speech for all actions
- **High Contrast**: Visual indicators for all states

### 📅 Advanced Calendar View
- **Monthly Calendar Grid**: Full calendar display with 42-cell grid (6 weeks)
- **Task Visualization**: Color-coded task indicators on due dates
- **Priority Colors**: High (red), Medium (orange), Low (green) priority indicators
- **Date Navigation**: Previous/next month navigation with today button
- **Task Details Panel**: Click dates to view tasks in detailed side panel
- **Overflow Handling**: Tasks without due dates displayed separately

### 📊 Comprehensive Statistics Dashboard
- **Overview Cards**: Total, Pending, Completed tasks with completion rate
- **Pie Chart**: Task status distribution with percentage labels
- **Bar Chart**: Tasks grouped by priority levels with color coding
- **Line Chart**: 7-day completion trend analysis
- **Productivity Metrics**: Average daily completions and insights
- **Responsive Charts**: Built with Recharts for interactive data visualization

### 🔔 Smart Notification System
- **Task Reminders**: Automatic notifications for upcoming and overdue tasks
- **Browser Notifications**: Native browser notifications with permission handling
- **Real-time Alerts**: Instant notifications for tasks due within 1 hour
- **Notification Center**: Centralized notification management in the header
- **Customizable Settings**: Enable/disable notifications, sounds, and reminders

### 🎨 Modern UI/UX
- **Material-UI Design**: Beautiful, responsive interface
- **Real-time Updates**: Live status updates and notifications
- **Smooth Animations**: Polished transitions and micro-interactions
- **Mobile Responsive**: Works perfectly on all device sizes

## 🚀 Quick Start

### Prerequisites
- Node.js (v16 or higher)
- MongoDB Atlas account (or local MongoDB)
- Modern browser with Web Speech API support (Chrome recommended)
- **Optional**: Ollama (for local AI) or API keys for Groq/Gemini (for cloud AI)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd voice-task-manager
   ```

2. **Setup Backend**
   ```bash
   cd backend
   npm install
   
   # Create .env file
   echo "MONGODB_URI=your_mongodb_connection_string" > .env
   echo "JWT_SECRET=your_jwt_secret" >> .env
   echo "PORT=5009" >> .env
   echo "FRONTEND_URL=http://localhost:8081" >> .env
   echo "NODE_ENV=development" >> .env
   
   npm start
   ```

3. **Setup Frontend**
   ```bash
   cd frontend
   npm install
   
   # Copy environment template
   cp .env.example .env
   
   npm run dev
   ```

4. **Setup Enhanced Voice Control (Optional)**
   
   **Option A: Local AI (Recommended)**
   ```bash
   # Install Ollama from https://ollama.ai/
   ollama pull llama3.2:3b
   ollama serve
   ```
   
   **Option B: Cloud AI**
   - Get Groq API key: https://console.groq.com/
   - Get Gemini API key: https://makersuite.google.com/app/apikey
   - Add to `frontend/.env`

5. **Access the Application**
   - Frontend: http://localhost:8082
   - GraphQL Playground: http://localhost:5009/graphql
   - **Enhanced Voice**: Toggle 🧠 AI mode in the voice controller

## 📋 Enhanced Task Management

### Multiple View Modes (within Tasks section)
- **List View**: Traditional task list with filtering and sorting
- **Calendar View**: Monthly calendar grid showing tasks on due dates
- **Statistics View**: Interactive charts and analytics dashboard

### 📅 Calendar View Features
- **Monthly Grid**: 42-cell calendar (6 weeks × 7 days) with navigation
- **Task Indicators**: Color-coded priority bars on dates with tasks
- **Task Count Badges**: Number badges showing task count per date
- **Date Selection**: Click dates to view detailed task list in side panel
- **Today Highlighting**: Current date visually highlighted
- **No Due Date Section**: Separate area for tasks without due dates

### 📊 Statistics Dashboard
- **Overview Cards**: Total, Pending, In-Progress, Completed task counts
- **Interactive Charts**: 
  - Pie chart for status distribution with percentages
  - Bar chart for priority distribution (Low/Medium/High)
  - Line chart for 7-day completion trend
- **Productivity Insights**: Completion rate, remaining tasks, daily averages
- **Responsive Design**: Charts adapt to screen size and theme

## 🔔 Notification System

### Notification Types
- **Overdue**: Tasks that have passed their due date (red alert)
- **Urgent**: Tasks due within 1 hour (orange warning)
- **Soon**: Tasks due within 24 hours (blue info)
- **Upcoming**: Tasks due within 3 days (gray info)

### Notification Features
- **Browser Notifications**: Native OS notifications when enabled
- **Notification Bell**: Header icon with unread count badge
- **Notification Center**: Dropdown menu showing all active reminders
- **Auto-refresh**: Checks for new reminders every minute
- **Persistent Storage**: Notifications persist across browser sessions

### Settings Configuration
Navigate to Settings page to configure:
- Enable/disable browser notifications
- Enable/disable notification sounds
- Enable/disable task reminders
- Request browser notification permissions

## 🎯 Enhanced Voice Commands Guide

### 🧠 AI Mode (Natural Language)

**English Commands:**
```
"Add urgent task buy milk tomorrow morning"
"Create high priority meeting for next Monday at 2pm"
"Mark the grocery shopping task as completed"
"Delete the old meeting task"
"Show me all pending tasks"
```

**Hindi Commands:**
```
"कल सुबह डॉक्टर के पास जाना है"
"grocery wala task complete kar do"
"meeting को urgent बना दो"
```

**Tamil Commands:**
```
"நாளை காலை மீட்டிங் வைக்கணும்"
"grocery task முடிச்சிட்டேன்"
```

**Code-Mixing:**
```
"kal grocery buy karna urgent"
"meeting को complete kar do"
"doctor appointment book करना है tomorrow"
```

### 🎤 Basic Mode (Keyword-Based)

**Task Creation:**
```
"Add task [title]"
"Create task [title] tomorrow"
"New task [title] urgent"
```

**Task Updates:**
```
"Mark task [title] complete"
"Update task [title]"
"Delete task [title]"
```

### 📅 Smart Date Recognition
- **Relative**: "today", "tomorrow", "next week"
- **Specific**: "December 15", "Monday", "5pm"
- **Multilingual**: "कल", "நாளை", "আগামীকাল"
- **Combined**: "tomorrow morning", "next Monday 2pm"

### 🚦 Priority Detection
- **High**: "urgent", "important", "asap", "ज़रूरी", "அவசரம்"
- **Medium**: Default priority
- **Low**: "later", "whenever", "बाद में", "பின்னர்"

## ⌨️ Keyboard Shortcuts

- **Tab**: Navigate between elements
- **Enter/Space**: Activate buttons or toggle task completion
- **Delete**: Remove focused task
- **Ctrl+V**: Start voice command
- **Ctrl+S**: Read task aloud (when task is focused)
- **Escape**: Cancel voice command or close dialogs

## 🏗️ Technical Architecture

### Backend (Node.js + GraphQL)
- **Apollo Server**: GraphQL API server
- **MongoDB**: NoSQL database with Mongoose ODM
- **Schema**: Tasks with title, description, status, dueDate, priority

### Frontend (React + Material-UI)
- **Apollo Client**: GraphQL client with caching
- **Material-UI v5**: Component library and theming
- **Recharts**: Interactive charts and data visualization
- **Web Speech API**: Voice recognition and synthesis
- **Date-fns**: Date parsing and formatting
- **Custom Utilities**: Calendar and statistics helper functions

### GraphQL Schema
```graphql
type Task {
  id: ID!
  title: String!
  description: String
  status: String!
  dueDate: String
  priority: String
  reminderEnabled: Boolean
  recurrence: String
  createdAt: String!
  updatedAt: String!
}

type Query {
  tasks: [Task!]!
  task(id: ID!): Task
  tasksByStatus(status: String!): [Task!]!
  tasksByPriority(priority: String!): [Task!]!
}

type Mutation {
  createTask(
    title: String!
    description: String
    status: String
    dueDate: String
    priority: String
    reminderEnabled: Boolean
    recurrence: String
  ): Task!
  
  updateTask(
    id: ID!
    title: String
    description: String
    status: String
    dueDate: String
    priority: String
    reminderEnabled: Boolean
    recurrence: String
  ): Task!
  
  deleteTask(id: ID!): Boolean!
  markTaskComplete(id: ID!): Task!
  bulkDeleteCompleted: Boolean!
  duplicateTask(id: ID!): Task!
}
```

## 🧪 Testing

### Voice Commands Testing
1. Open the app in Chrome (best Web Speech API support)
2. Allow microphone permissions
3. Click "Start Voice Command" button
4. Try various voice commands from the guide above

### Accessibility Testing
1. Use screen reader (NVDA, JAWS, VoiceOver)
2. Navigate using only keyboard
3. Test high contrast mode
4. Verify all interactive elements have proper labels

## 🧠 AI Voice Setup

### Quick Setup Options

**🏠 Local AI (Recommended - FREE & Private)**
```bash
# 1. Install Ollama
curl -fsSL https://ollama.ai/install.sh | sh

# 2. Download model
ollama pull llama3.2:3b

# 3. Start service
ollama serve
```

**☁️ Cloud AI (FREE tiers available)**

*Groq (Fast):*
1. Get API key: https://console.groq.com/
2. Add to `.env`: `VITE_GROQ_API_KEY=your_key`

*Google Gemini:*
1. Get API key: https://makersuite.google.com/app/apikey
2. Add to `.env`: `VITE_GEMINI_API_KEY=your_key`

### Features Comparison

| Feature | Basic Mode | AI Mode |
|---------|------------|---------|
| Language Support | English only | 10+ languages |
| Command Flexibility | Keywords only | Natural language |
| Date Understanding | Limited | Smart parsing |
| Priority Detection | Manual | Automatic |
| Code-Mixing | ❌ | ✅ |
| Offline Support | ✅ | ✅ (with Ollama) |

📖 **Detailed Setup**: See [VOICE_SETUP.md](./VOICE_SETUP.md) for complete instructions.

## 🔧 Configuration

### Environment Variables

**Backend (.env)**
```
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/database
JWT_SECRET=your-secret-key-here
PORT=5009
FRONTEND_URL=http://localhost:8081
NODE_ENV=development
```

**Frontend (.env)**
```
# LLM Configuration (Optional - for AI voice control)
VITE_LLM_ENDPOINT=http://localhost:11434/api/generate
VITE_LLM_MODEL=llama3.2:3b
VITE_GROQ_API_KEY=your_groq_key_here
VITE_GEMINI_API_KEY=your_gemini_key_here
VITE_BACKEND_URL=http://localhost:5014
```

### Browser Compatibility
- **Chrome**: Full support (recommended)
- **Edge**: Full support
- **Firefox**: Limited Web Speech API support
- **Safari**: Limited Web Speech API support

## 📱 Deployment

### Frontend (Netlify)
```bash
cd frontend
npm run build
# Deploy dist folder to Netlify
```

### Backend (Heroku)
```bash
cd backend
# Add Procfile: web: node server.js
git push heroku main
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

MIT License - see LICENSE file for details

## 🙏 Acknowledgments

- Web Speech API documentation
- Material-UI team for excellent components
- Apollo GraphQL for powerful data management
- MongoDB for flexible data storage

---

**Built with ❤️ using React, GraphQL, and Web Speech API**