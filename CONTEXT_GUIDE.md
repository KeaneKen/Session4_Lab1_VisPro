# Flutter State Management Codelab - Context Guide

## Overview

This repository contains two Flutter applications that demonstrate fundamental state management patterns in Flutter development. This is designed as a learning exercise for Session 4, Lab 1 of Visual Programming coursework.

## Learning Objectives

By working through these code examples, students will understand:

1. **The difference between ephemeral and app state**
2. **When to use each state management approach**
3. **How to implement local state with StatefulWidget**
4. **How to implement global state with Provider pattern**
5. **The lifecycle and scope of different state types**

## Project Structure

### 1. Ephemeral State Codelab (`ephemeral_state_codelab/`)

**Purpose**: Demonstrates local state management within a single widget.

**Key Concepts**:
- Uses `StatefulWidget` and `setState()`
- State is local to the widget and its children
- State is destroyed when the widget is removed from the widget tree
- Suitable for UI-specific state like form inputs, animations, or component-level data

**Implementation Details**:
- `MyEphemeralApp`: Main application widget (StatelessWidget)
- `CounterWidget`: StatefulWidget that manages a counter value
- `_CounterWidgetState`: Contains the mutable state (`_counter`) and increment logic
- State is managed entirely within the widget's `State` object

**Code Example**:
```dart
class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;  // Ephemeral state - local to this widget

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Counter Value: $_counter'),
          ElevatedButton(
            onPressed: () {
              setState(() {  // Updates local state only
                _counter++;
              });
            },
            child: const Text('Increment'),
          ),
        ],
      ),
    );
  }
}
```

### 2. App State Codelab (`app_state_codelab/`)

**Purpose**: Demonstrates global state management across multiple widgets.

**Key Concepts**:
- Uses Provider pattern with `ChangeNotifier`
- State is shared across the entire application
- State persists as long as the application is running
- Suitable for user data, application settings, or cross-widget communication

**Implementation Details**:
- `CounterModel`: Extends `ChangeNotifier` to manage shared state
- `MyApp`: Provides the model to the widget tree using `ChangeNotifierProvider`
- `CounterWidget`: Consumes the model using `Consumer<CounterModel>`
- State changes notify all listening widgets automatically

**Code Example**:
```dart
class CounterModel extends ChangeNotifier {
  int _counter = 0;  // App state - shared globally

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();  // Notifies all consumers
  }

  void decrement() {
    _counter--;
    notifyListeners();  // Notifies all consumers
  }
}

// Usage in widget
Consumer<CounterModel>(
  builder: (context, model, child) => Column(
    children: [
      Text('Counter Value: ${model.counter}'),
      ElevatedButton(
        onPressed: () => model.increment(),  // Calls shared state method
        child: Text('Increment'),
      ),
    ],
  ),
)
```

## Key Differences Summary

| Aspect | Ephemeral State | App State |
|--------|----------------|-----------|
| **Scope** | Single widget and its children | Entire application |
| **Lifespan** | Widget lifecycle | Application lifecycle |
| **Management** | `setState()` in StatefulWidget | Provider/ChangeNotifier |
| **Use Cases** | Form inputs, animations, local UI state | User data, app settings, shared data |
| **Complexity** | Simple, straightforward | More complex setup, better scalability |

## When to Use Each Approach

### Use Ephemeral State When:
- State is only needed by one widget
- State doesn't need to be shared
- Simple UI interactions (toggles, form inputs, animations)
- Performance is critical for local updates

### Use App State When:
- Multiple widgets need access to the same data
- State should persist across navigation
- Complex business logic is involved
- You need to separate UI from business logic

## Running the Projects

Each project is a complete Flutter application. To run them:

1. Navigate to the project directory
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the application

## Testing

Both projects include widget tests that demonstrate how to test stateful widgets:

- **Ephemeral State Tests**: Test local state changes within a widget
- **App State Tests**: Test global state changes using Provider

## Dependencies

### Ephemeral State Codelab
- `flutter`: Core Flutter framework
- `cupertino_icons`: iOS-style icons

### App State Codelab
- `flutter`: Core Flutter framework
- `provider`: State management library for sharing state across widgets
- `cupertino_icons`: iOS-style icons

## Student Reflection

The original README.md contains student reflections on the key differences between these state management approaches, highlighting understanding of:
1. Global vs. local scope
2. Lifespan differences
3. Responsibility and use case distinctions

This codelab provides hands-on experience with both fundamental approaches to state management in Flutter, preparing students for more complex state management patterns in larger applications.