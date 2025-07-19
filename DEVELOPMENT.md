# Flutter TODO App - Development Guide

## GitHub Copilot Integration

This project demonstrates the power of GitHub Copilot in VS Code for Flutter development. Here are some ways Copilot was used:

### Code Generation
- Model classes with JSON serialization
- Provider pattern implementation
- Widget creation with proper state management
- Test case generation

### Best Practices Followed
- Clean Architecture principles
- Separation of concerns
- Proper error handling
- Comprehensive testing
- Code documentation

## Development Commands

### Testing
```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/models/todo_test.dart
```

### Building
```bash
# Debug build
flutter build apk --debug

# Release build
flutter build apk --release

# iOS build (macOS only)
flutter build ios --release
```

### Code Quality
```bash
# Analyze code
flutter analyze

# Format code
dart format lib/ test/

# Fix imports
dart fix --apply
```

## VS Code Tasks

This project includes predefined VS Code tasks for common Flutter operations:

- **Flutter: Clean** - Clean build files
- **Flutter: Get Packages** - Install dependencies  
- **Flutter: Run Tests** - Execute test suite
- **Flutter: Build APK** - Build release APK
- **Generate Code Coverage** - Run tests with coverage

## Troubleshooting

### Flutter Not Found
If you see "flutter command not found":
1. Install Flutter SDK from https://flutter.dev
2. Add Flutter to your system PATH
3. Run `flutter doctor` to verify installation

### Build Issues
- Run `flutter clean` then `flutter pub get`
- Check for conflicting dependencies
- Verify Android SDK/Xcode setup

### Test Failures
- Ensure all dependencies are installed
- Check for mock data setup in tests
- Verify SharedPreferences mocking
