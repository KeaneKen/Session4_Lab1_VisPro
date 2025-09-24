# Flutter State Management Codelab - Session 4 Lab 1

This repository demonstrates two fundamental state management patterns in Flutter through hands-on examples.

## Quick Start

For detailed context, learning objectives, and implementation explanations, see **[CONTEXT_GUIDE.md](./CONTEXT_GUIDE.md)**.

## Projects Overview

- **`ephemeral_state_codelab/`**: Local state management with StatefulWidget
- **`app_state_codelab/`**: Global state management with Provider pattern

## Student Reflection

The first difference is app state is more global, shared across the application, and needs robust management while ephemeral state is more local to a single widget and typically managed with the widget's internal State object (basically app state is for the entire app, meanwhile ephemeral state is only for singular widget).

The second difference is the lifespan: App State lifespan is basically the same as the app itself, meanwhile ephemeral has a shorter lifespan and lasts only as long as the widget is mounted and visible in the widget tree.

The third (and final) difference is the responsibility: app state is responsible for managing data that's being shared and accessed by multiple widgets, meanwhile ephemeral is responsible for managing data that is local to a particular widget or UI component.

## Key Takeaways

- **Ephemeral State**: Perfect for form inputs, animations, and component-level interactions
- **App State**: Essential for user data, application settings, and cross-widget communication
- **Architecture**: Proper state management leads to more maintainable and scalable applications
