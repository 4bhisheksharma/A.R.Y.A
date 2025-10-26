# A.R.Y.A - Adaptive Real-time Yielding Assistant | Flutter AI Voice Assistant App

A modern, futuristic AI voice assistant app built with Flutter, featuring speech-to-text capabilities and OpenRouter AI integration.

## Features

- 🎤 **Voice Recognition**: Real-time speech-to-text using Flutter's speech_to_text package
- 🤖 **AI Integration**: Powered by OpenRouter AI (GPT-4o-mini)
- 🔥 **Modern UI**: Beautiful orange-themed futuristic design with Lottie animations
- 💬 **Interactive Chat**: Send voice commands and receive AI-powered responses
- 📱 **Cross-platform**: Works on Android, iOS, and more

## Setup

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- An OpenRouter API key (get one at [openrouter.ai](https://openrouter.ai))

### Installation

1. Clone the repository:

```bash
git clone https://github.com/4bhisheksharma/A.R.Y.A.git
cd arya
```

2. Install dependencies:

```bash
flutter pub get
```

3. Create a `.env` file in the root directory:

```bash
cp .env.example .env
```

4. Add your OpenRouter API key to the `.env` file:

```env
OPENROUTER_API_KEY=your_api_key_here
SITE_URL=https://github.com/4bhisheksharma/A.R.Y.A
SITE_NAME=A.R.Y.A
```

5. Run the app:

```bash
flutter run
```

## Usage

1. **Tap the microphone button** at the bottom right to start voice recognition
2. **Grant microphone permission** when prompted
3. **Speak your question or command**
4. **Tap "Send to AI"** to get an AI-powered response
5. View the AI's response in the response section below

## Configuration

The app uses the following OpenRouter model by default:

- Model: `openai/gpt-4o-mini-2024-07-18`

You can change the model in `lib/services/openai_service.dart` by updating the `model` variable.

## Technologies Used

- **Flutter** - Cross-platform UI framework
- **OpenRouter API** - AI model access
- **speech_to_text** - Voice recognition
- **flutter_dotenv** - Environment variable management
- **Lottie** - Animations
- **http** - API requests

## License

This project is open source and available under the MIT License.
