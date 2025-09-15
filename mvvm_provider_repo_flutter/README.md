# mvvm_provider_repo_flutter

A Flutter project Using MVVM(Model View ViewModel) Architecture with Provider State Management and Shared Preferences.

## Directory Structure

```
lib/
│
├── data/ # Data Layer
│ ├── network/ # Handles API calls
│ │ ├── base_api_services.dart # Abstract class for API methods (GET, POST)
│ │ └── network_api_services.dart # Implements API methods using http
│ │
│ ├── response/ # API response handling
│ │ ├── api_response.dart # Generic API response wrapper
│ │ ├── status.dart # Enum for API status (loading, completed, error)
│ │
│ ├── app_exception.dart # Custom exceptions for API errors
│ │
├── model/ # Data models
│ └── user_model.dart # User model class (for login/signup data)
│
├── repository/ # Repository Layer (connects VM to data layer)
│ ├── auth_repository.dart # Auth-related API calls (login/signup)
│ 
│
├── res/ # App Resources
│ ├── components/ # Reusable UI widgets
│ │ └── round_button.dart # Custom round button widget
│ ├── app_urls.dart # Stores API endpoints (base URLs, paths)
│ └── colors.dart # App color constants
│
├── utils/ # Utility classes
│ ├── routes # Defines navigation routes
│ │ └── roures_name.dart # Stores all route name constants in one place 
│ │ └── routes.dart # Defines the navigation logic
│ │
│ └── utils.dart # Common helper functions (snackbars, validations)
│
├── view/ # UI Layer (Screens)
│ ├── home_screen.dart # Home screen after login
│ ├── login_view.dart # Login screen UI
│ ├── signup_view.dart # Signup screen UI
│ └── splash_view.dart # Splash screen UI
│
├── view_model/ # ViewModels (State Management with Provider)
│ ├── services/ # ViewModel helper services
│ │ └── splash_services.dart # Controls splash screen logic (navigation delay)
│ ├── auth_viewmodel.dart # Auth state handling (login/signup)
│ └── user_viewmodel.dart # User state handling (fetch/store user data)
│
└── main.dart # App entry point (MaterialApp, routes, providers)

```