# TODO App 📝

A modern and intuitive TODO application built with Flutter, demonstrating clean architecture and best practices for mobile app development.

## Features ✨

- ✅ **Add/Edit/Delete Tasks**: Create, modify, and remove tasks effortlessly
- 🏷️ **Task Categories**: Organize tasks with customizable categories
- ⏰ **Due Dates & Reminders**: Set deadlines and get notified
- 📱 **Responsive Design**: Works seamlessly across different screen sizes
- 🔄 **State Management**: Powered by Provider for efficient state management
- 💾 **Local Storage**: Tasks persist locally using SharedPreferences
- 🌐 **API Integration**: HTTP client integration for potential backend sync
- 🎨 **Material Design**: Beautiful and intuitive user interface
- 📅 **Date Formatting**: User-friendly date display with intl package

## Screenshots 📸

> Add screenshots of your app here once implemented

## Getting Started 🚀

### Prerequisites

- **Flutter SDK**: Version 3.0.0 or higher
- **Dart SDK**: Included with Flutter
- **VS Code** or **Android Studio** (recommended IDEs)
- **Git** for version control

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/ebtsamzyada/TODO-APP.git
   cd TODO-APP
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## Project Structure 📁

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── todo.dart            # TODO model class
│   └── category.dart        # Category model class
├── providers/               # State management
│   ├── todo_provider.dart   # TODO state provider
│   └── category_provider.dart
├── screens/                 # UI screens
│   ├── home_screen.dart     # Main TODO list screen
│   ├── add_todo_screen.dart # Add/Edit TODO screen
│   └── settings_screen.dart # App settings
├── widgets/                 # Reusable UI components
│   ├── todo_item.dart       # Individual TODO item widget
│   ├── category_selector.dart
│   └── custom_button.dart
├── services/                # Business logic
│   ├── todo_service.dart    # TODO operations
│   ├── storage_service.dart # Local storage handling
│   └── api_service.dart     # HTTP API calls
└── utils/                   # Utility functions
    ├── constants.dart       # App constants
    └── helpers.dart         # Helper functions
```

## Dependencies 📦

### Core Dependencies
- **flutter**: SDK framework
- **provider**: State management solution
- **shared_preferences**: Local data persistence
- **http**: HTTP client for API calls
- **intl**: Internationalization and date formatting
- **cupertino_icons**: iOS-style icons

### Development Dependencies
- **flutter_test**: Testing framework
- **flutter_lints**: Linting rules
- **mockito**: Mocking for tests
- **build_runner**: Code generation

## Building the App 🔨

### Development Build
```bash
flutter run --debug
```

### Release Build (Android)
```bash
flutter build apk --release
```

### Release Build (iOS)
```bash
flutter build ios --release
```

## Testing 🧪

Run all tests:
```bash
flutter test
```

Generate test coverage:
```bash
flutter test --coverage
```

Run linting:
```bash
flutter analyze
```

## Available Tasks 📋

The project includes several VS Code tasks for common operations:

- **Flutter: Clean** - Clean build files
- **Flutter: Get Packages** - Install dependencies
- **Flutter: Run Tests** - Execute test suite
- **Flutter: Build APK** - Create release APK
- **Generate Code Coverage** - Create coverage reports

## Contributing 🤝

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Code Style Guidelines 📏

- Follow [Flutter's style guide](https://dart.dev/guides/language/effective-dart/style)
- Use meaningful variable and function names
- Add comments for complex logic
- Maintain consistent formatting (use `flutter format`)
- Write unit tests for business logic

## Performance Considerations ⚡

- Uses Provider for efficient state management
- Implements lazy loading for large task lists
- Optimized image assets and custom fonts
- Minimizes widget rebuilds with proper state management

## Future Enhancements 🚀

- [ ] Dark/Light theme toggle
- [ ] Task search and filtering
- [ ] Drag and drop task reordering
- [ ] Task sharing functionality
- [ ] Cloud synchronization
- [ ] Push notifications
- [ ] Multiple language support
- [ ] Task analytics and statistics

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author 👨‍💻

**Ebtsam Zyada**
- GitHub: [@ebtsamzyada](https://github.com/ebtsamzyada)

## Acknowledgments 🙏

- Flutter team for the amazing framework
- Material Design for the design principles
- Open source community for the helpful packages

---

**Happy Coding!** 🎉