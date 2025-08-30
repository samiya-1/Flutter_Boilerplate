# provider_boiler_plate

A new Flutter boiler plate project using provider.

## MVVM - Model–View–ViewModel

Model → Data (business objects, API models, repository logic).

View → UI (Flutter widgets, screens).

ViewModel → State + Business logic (exposes data to the View and handles user actions).

In Flutter, Provider (or Riverpod) is used to connect the View with the ViewModel.

The View listens to ChangeNotifier/Notifier updates.

The ViewModel holds the logic and updates state.

The Model (repositories, API, DB) is independent.


### Directory Structure

```
lib/
 ├── main.dart
 ├── core/                   # shared stuff (theme, constants, utils)
 ├── data/                   # Models + Repositories
 │    ├── models/
 │    │     └── user.dart
 │    └── repositories/
 │          └── user_repository.dart
 ├── ui/
 │    ├── login/
 │    │     ├── login_view.dart         # View
 │    │     ├── login_viewmodel.dart    # ViewModel (ChangeNotifier)
 │    │     └── widgets/                # Local widgets
 │    └── home/
 │          ├── home_view.dart
 │          └── home_viewmodel.dart
 ├── widgets/               # shared reusable widgets
 └── services/              # APIs, Firebase, DB

```


