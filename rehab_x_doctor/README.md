# Rehab X Patient App

A Flutter application for rehabilitation exercises, designed to help patients with their physical therapy routines.

## Features

- List of rehabilitation exercises
- Detailed exercise instructions
- QR code scanning for quick exercise access
- Support for multiple languages (English and Thai)
- Camera integration for exercise form checking

## Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Android Studio / VS Code
- Android SDK / Xcode (for iOS development)

### Installation

1. Clone the repository:
```bash
git clone [repository-url]
```

2. Navigate to the project directory:
```bash
cd rehab_x_patient
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
  ├── models/         # Data models
  ├── screens/        # UI screens
  ├── widgets/        # Reusable widgets
  ├── services/       # API and other services
  └── utils/          # Utility functions
```

## Dependencies

- qr_code_scanner: ^1.0.1
- camera: ^0.10.5+5
- path_provider: ^2.1.1
- shared_preferences: ^2.2.2
- provider: ^6.1.1
- http: ^1.1.0

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
