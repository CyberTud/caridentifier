# CarPeek 🚗 - AI Car Identifier

A sophisticated Flutter application that uses AI-powered vision technology to identify cars from photos. Simply take a picture of any car, and CarPeek will provide detailed information about the make, model, year, specifications, and price estimates.

**App Store Ready** - Fully configured for iOS App Store submission with privacy policy, terms of service, and complete metadata.

## Features

- **AI-Powered Car Recognition**: Uses OpenAI's GPT-4 Vision API to accurately identify vehicles
- **Comprehensive Vehicle Information**:
  - Make, Model, and Generation
  - Year range and body style
  - Trim level predictions with confidence scores
  - Engine options and drivetrain details
  - Price estimates (MSRP and used market values)
  - Maintenance tips and notable history
  - Similar model comparisons
- **Beautiful Material 3 Design**: Modern UI with smooth animations and intuitive navigation
- **Offline Caching**: Previously identified cars are saved for offline viewing
- **Camera Integration**: Take photos directly or select from gallery

## Tech Stack

### Frontend (Flutter)
- **State Management**: Riverpod
- **Navigation**: go_router
- **Local Storage**: Hive
- **Architecture**: Clean Architecture with Domain-Driven Design
- **Code Generation**: Freezed, json_serializable, build_runner

### Backend (Node.js)
- **Framework**: Express.js
- **AI Integration**: OpenAI API (GPT-4 Vision)
- **Image Processing**: Multer
- **Security**: Helmet, CORS, Rate Limiting

## Setup Instructions

### Prerequisites
- Flutter SDK (3.0 or higher)
- Node.js (16.0 or higher)
- Xcode (for iOS development)
- OpenAI API key

### Backend Setup

1. Navigate to the backend directory:
```bash
cd backend
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file with your OpenAI API key:
```env
OPENAI_API_KEY=your-api-key-here
PORT=3000
NODE_ENV=development
```

4. Start the server:
```bash
npm run dev
```

### Flutter App Setup

1. Install Flutter dependencies:
```bash
flutter pub get
```

2. Generate code files:
```bash
dart run build_runner build --delete-conflicting-outputs
```

3. Update the backend URL in `lib/application/providers/settings_provider.dart` to match your local IP address.

4. Run the app:
```bash
flutter run
```

### iOS Deployment

1. Open the iOS project in Xcode:
```bash
open ios/Runner.xcworkspace
```

2. Configure signing & capabilities with your Apple Developer account

3. Deploy to your device:
```bash
flutter run --release
```

## Project Structure

```
car_identifier/
├── lib/                        # Flutter app source
│   ├── domain/                 # Domain layer (entities, repositories)
│   ├── application/            # Application layer (providers, services)
│   ├── infrastructure/         # Infrastructure layer (APIs, repositories)
│   └── presentation/           # Presentation layer (screens, widgets)
├── backend/                    # Node.js backend
│   └── src/
│       ├── routes/            # API routes
│       ├── services/          # Business logic
│       ├── middleware/        # Express middleware
│       └── utils/             # Utility functions
└── ios/                       # iOS project files

```

## API Endpoints

- `POST /api/analyze-image` - Analyze a car image
  - Request: Multipart form data with image file and optional hint
  - Response: Detailed car analysis JSON

## Screenshots

The app features:
- Camera capture screen with live preview
- Analysis loading screen with progress indicators
- Detailed results screen with:
  - Car identification and confidence score
  - Specifications cards
  - Price estimates with market insights
  - Maintenance timeline
  - Similar models carousel
- Recent analyses screen with cached results
- Settings screen for backend configuration

## Contributing

Feel free to submit issues and enhancement requests!

## License

MIT License

## Acknowledgments

- OpenAI for the powerful GPT-4 Vision API
- Flutter team for the excellent framework
- All the open-source packages that made this project possible
