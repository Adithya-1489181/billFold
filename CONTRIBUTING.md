# Contributing to billFold

Thank you for your interest in contributing to billFold! This document provides guidelines and instructions for contributing to this project.

## Table of Contents

- [About the Project](#about-the-project)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setting Up Development Environment](#setting-up-development-environment)
- [Development Workflow](#development-workflow)
- [Coding Standards](#coding-standards)
- [Testing](#testing)
- [Committing Changes](#committing-changes)
- [Submitting a Pull Request](#submitting-a-pull-request)
- [Reporting Issues](#reporting-issues)
- [Code of Conduct](#code-of-conduct)
- [Questions and Support](#questions-and-support)

## About the Project

billFold is a tailored application for individual self-employed professionals to create bills and invoices easily on their mobile devices. Built with Flutter, it provides a cross-platform solution for iOS, Android, Web, Linux, macOS, and Windows.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK**: Version 3.8.0 or higher
  - Download from [flutter.dev](https://flutter.dev/docs/get-started/install)
- **Dart SDK**: Comes bundled with Flutter
- **IDE**: Choose one of the following:
  - [Android Studio](https://developer.android.com/studio) with Flutter plugin
  - [VS Code](https://code.visualstudio.com/) with Flutter extension
  - [IntelliJ IDEA](https://www.jetbrains.com/idea/) with Flutter plugin
- **Git**: For version control
- **Platform-specific requirements**:
  - **Android**: Android Studio, Android SDK
  - **iOS**: macOS with Xcode (for iOS development)
  - **Web**: Chrome browser
  - **Desktop**: Platform-specific build tools

### Setting Up Development Environment

1. **Fork the repository**

   Visit [https://github.com/Adithya-1489181/billFold](https://github.com/Adithya-1489181/billFold) and click the "Fork" button.

2. **Clone your fork**

   ```bash
   git clone https://github.com/YOUR_USERNAME/billFold.git
   cd billFold
   ```

3. **Add upstream remote**

   ```bash
   git remote add upstream https://github.com/Adithya-1489181/billFold.git
   ```

4. **Install dependencies**

   ```bash
   flutter pub get
   ```

5. **Verify installation**

   ```bash
   flutter doctor
   ```

   Ensure all checks pass for your target platform.

6. **Run the app**

   ```bash
   flutter run
   ```

   For specific platforms:
   ```bash
   flutter run -d chrome        # Web
   flutter run -d android       # Android
   flutter run -d ios           # iOS
   flutter run -d macos         # macOS
   flutter run -d windows       # Windows
   flutter run -d linux         # Linux
   ```

## Development Workflow

1. **Create a new branch**

   ```bash
   git checkout -b feature/your-feature-name
   ```

   Branch naming conventions:
   - `feature/` - New features
   - `bugfix/` - Bug fixes
   - `hotfix/` - Urgent fixes
   - `docs/` - Documentation updates
   - `refactor/` - Code refactoring
   - `test/` - Adding or updating tests

2. **Keep your branch updated**

   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

3. **Make your changes**

   - Write clean, maintainable code
   - Follow the coding standards (see below)
   - Add tests for new features
   - Update documentation as needed

4. **Test your changes**

   ```bash
   flutter test
   flutter analyze
   ```

## Coding Standards

This project follows the official Dart and Flutter coding conventions.

### Style Guide

- Follow the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use the [Flutter Style Guide](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo)
- The project uses `flutter_lints` package for linting rules

### Code Formatting

- Use `dart format` to automatically format your code:

  ```bash
  dart format .
  ```

### Linting

- Run the analyzer before committing:

  ```bash
  flutter analyze
  ```

- Fix all warnings and errors reported by the analyzer
- The project uses rules defined in `analysis_options.yaml`

### Best Practices

- **State Management**: This project uses Riverpod for state management
- **Comments**: Write meaningful comments for complex logic
- **Naming Conventions**:
  - Classes: `PascalCase`
  - Variables and functions: `camelCase`
  - Constants: `lowerCamelCase` with `const` or `final`
  - Private members: prefix with underscore `_`
- **File Organization**: Keep files focused and follow the existing project structure
- **Assets**: Place assets in the `assets/` directory

## Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run a specific test file
flutter test test/widget_test.dart

# Run tests with coverage
flutter test --coverage
```

### Writing Tests

- Write unit tests for business logic
- Write widget tests for UI components
- Follow the existing test structure in the `test/` directory
- Aim for meaningful test coverage
- Use descriptive test names

Example test structure:
```dart
void main() {
  group('FeatureName', () {
    test('should do something specific', () {
      // Arrange
      // Act
      // Assert
    });
  });
}
```

## Committing Changes

### Commit Message Format

Follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types**:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, no code change)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Examples**:
```
feat(billing): add invoice generation feature

fix(ui): resolve button alignment issue on small screens

docs: update README with installation instructions

test(billing): add unit tests for invoice calculation
```

### Before Committing

1. Ensure code is properly formatted: `dart format .`
2. Run the analyzer: `flutter analyze`
3. Run tests: `flutter test`
4. Review your changes: `git diff`

## Submitting a Pull Request

1. **Push your branch**

   ```bash
   git push origin feature/your-feature-name
   ```

2. **Create a Pull Request**

   - Go to your fork on GitHub
   - Click "New Pull Request"
   - Select your branch
   - Fill in the PR template with:
     - Clear description of changes
     - Related issue number (if applicable)
     - Screenshots (for UI changes)
     - Testing steps

3. **PR Requirements**

   - All tests must pass
   - Code must pass linting checks
   - Changes should be focused and minimal
   - Documentation should be updated if needed
   - At least one maintainer approval required

4. **Respond to Feedback**

   - Address review comments promptly
   - Push additional commits to the same branch
   - Request re-review when ready

5. **After Merge**

   - Delete your feature branch
   - Update your local main branch:
     ```bash
     git checkout main
     git pull upstream main
     ```

## Reporting Issues

### Before Creating an Issue

- Check if the issue already exists
- Verify the issue with the latest version
- Collect relevant information

### Creating an Issue

Use the following template:

**Bug Report**:
```
**Description**
A clear description of the bug.

**Steps to Reproduce**
1. Step 1
2. Step 2
3. ...

**Expected Behavior**
What you expected to happen.

**Actual Behavior**
What actually happened.

**Environment**
- Flutter version:
- Dart version:
- Platform (Android/iOS/Web/Desktop):
- Device/Emulator:

**Screenshots**
If applicable, add screenshots.
```

**Feature Request**:
```
**Feature Description**
Clear description of the proposed feature.

**Use Case**
Why is this feature needed?

**Proposed Solution**
How should this feature work?

**Alternatives Considered**
Any alternative approaches?
```

## Code of Conduct

### Our Pledge

We are committed to providing a welcoming and inclusive environment for all contributors.

### Expected Behavior

- Be respectful and considerate
- Use welcoming and inclusive language
- Accept constructive criticism gracefully
- Focus on what is best for the community
- Show empathy towards others

### Unacceptable Behavior

- Harassment or discriminatory language
- Personal attacks or trolling
- Publishing private information without permission
- Any conduct that could be considered inappropriate in a professional setting

## Questions and Support

- **Issues**: For bug reports and feature requests, use [GitHub Issues](https://github.com/Adithya-1489181/billFold/issues)
- **Discussions**: For questions and general discussions, use [GitHub Discussions](https://github.com/Adithya-1489181/billFold/discussions)
- **Repository**: [https://github.com/Adithya-1489181/billFold](https://github.com/Adithya-1489181/billFold)

---

Thank you for contributing to billFold! Your efforts help make this project better for everyone. 🎉
