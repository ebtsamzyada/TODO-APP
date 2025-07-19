# Flutter TODO App Development Prompt

## Project Overview
This is a Flutter TODO application built with clean architecture principles. The app allows users to manage tasks with features like adding, editing, deleting, categorizing, and setting due dates for tasks.

## Tech Stack
- **Framework**: Flutter (SDK >=3.0.0)
- **Language**: Dart
- **State Management**: Provider pattern
- **Local Storage**: SharedPreferences
- **HTTP Client**: http package
- **Date Handling**: intl package
- **Testing**: flutter_test, mockito
- **Architecture**: Clean Architecture with Provider

## Project Structure Guidelines
```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models (Todo, Category)
├── providers/                # State management (Provider classes)
├── screens/                  # UI screens
├── widgets/                  # Reusable UI components
├── services/                 # Business logic & API calls
└── utils/                    # Constants & helper functions
```

## Coding Standards & Best Practices

### Dart/Flutter Conventions
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `lowerCamelCase` for variables and functions
- Use `UpperCamelCase` for classes and enums
- Use descriptive variable and function names
- Add documentation comments for public APIs
- Use `const` constructors where possible for performance

### Code Organization
- Keep widgets focused and single-responsibility
- Extract reusable widgets into separate files
- Use proper folder structure as outlined above
- Separate business logic from UI components
- Use services for API calls and data operations

### State Management with Provider
- Create separate Provider classes for different features
- Use `ChangeNotifier` for mutable state
- Implement proper dispose methods to prevent memory leaks
- Use `Consumer` and `Selector` widgets appropriately
- Avoid rebuilding entire widget trees unnecessarily

## Feature Implementation Guidelines

### TODO Model Structure
```dart
class Todo {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime? dueDate;
  final String category;
  final Priority priority;
}
```

### UI/UX Requirements
- Follow Material Design 3 principles
- Implement responsive design for different screen sizes
- Use consistent spacing and typography
- Provide visual feedback for user actions
- Include proper error handling and loading states
- Ensure accessibility features (semantic labels, etc.)

### Data Persistence
- Use SharedPreferences for local storage
- Implement proper serialization/deserialization
- Handle data migration if schema changes
- Provide offline-first experience

### Testing Requirements
- Write unit tests for business logic
- Create widget tests for UI components
- Mock external dependencies (API calls, storage)
- Aim for >80% code coverage
- Test error scenarios and edge cases

## API Integration Guidelines
- Implement proper error handling for network calls
- Use appropriate HTTP status codes
- Implement retry logic for failed requests
- Handle offline scenarios gracefully
- Use proper data models for API responses

## Performance Considerations
- Use `const` constructors for static widgets
- Implement lazy loading for large lists
- Optimize image loading and caching
- Profile app performance regularly
- Minimize widget rebuilds

## Security Best Practices
- Validate all user inputs
- Sanitize data before storage
- Use secure storage for sensitive data
- Implement proper authentication if needed

## Accessibility Guidelines
- Add semantic labels to interactive elements
- Ensure proper contrast ratios
- Support screen readers
- Provide alternative text for images
- Test with accessibility tools

## Code Generation & AI Assistant Instructions

### When creating new features:
1. Follow the established project structure
2. Create corresponding test files
3. Update documentation if adding public APIs
4. Use existing design patterns and conventions
5. Consider accessibility from the start

### When refactoring:
1. Maintain backward compatibility where possible
2. Update tests to reflect changes
3. Consider performance implications
4. Follow single responsibility principle

### When fixing bugs:
1. Write a failing test first (TDD approach)
2. Implement the minimal fix
3. Ensure all tests pass
4. Consider if the fix needs documentation updates

## Dependencies Management
- Keep dependencies up to date but stable
- Avoid unnecessary dependencies
- Prefer official Flutter/Dart packages
- Document why each dependency is needed

## Git Workflow
- Use descriptive commit messages
- Keep commits atomic and focused
- Use feature branches for new development
- Include tests with feature implementations

## Common Patterns to Use

### Error Handling
```dart
try {
  // API call or operation
} on NetworkException catch (e) {
  // Handle network errors
} on ValidationException catch (e) {
  // Handle validation errors
} catch (e) {
  // Handle unexpected errors
}
```

### Loading States
```dart
Consumer<TodoProvider>(
  builder: (context, provider, child) {
    if (provider.isLoading) {
      return CircularProgressIndicator();
    }
    return TodoList(todos: provider.todos);
  },
)
```

### Form Validation
```dart
final _formKey = GlobalKey<FormState>();
// Use TextFormField with validators
// Validate before submission
```

## File Naming Conventions
- Use `snake_case` for file names
- Append appropriate suffixes: `_screen.dart`, `_widget.dart`, `_service.dart`, `_provider.dart`
- Keep file names descriptive but concise

## Comments & Documentation
- Write self-documenting codgit add .
git commit -m "Push all changes"
git pushe with clear names
- Add comments for complex business logic
- Document public APIs with /// doc comments
- Explain "why" not "what" in comments

Remember: Focus on creating maintainable, testable, and user-friendly code that follows Flutter best practices and provides a great user experience for managing todos.


