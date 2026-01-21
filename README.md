# Movie App - Ten Twenty Assignment

A Flutter movie application built with Clean Architecture, integrating with The Movie Database (TMDB) API.

## Features

- **Watch Screen**: Browse upcoming movies with genre filtering
- **Movie Search**: Search movies by title with genre-based filtering
- **Movie Details**: View comprehensive movie information, images, and trailers
- **Trailer Player**: YouTube-based trailer playback
- **Seat Selection**: Interactive seat booking interface
- **Bookings**: View and manage movie bookings
- **Media Library**: Browse saved media content
- **Dashboard**: Home screen with bottom navigation

## Architecture

The project follows **Clean Architecture** with clear separation of concerns:

```
lib/
├── main.dart                          # App entry point
├── src/
│   ├── config/                        # App configuration
│   │   ├── injector/                  # Dependency injection (GetIt)
│   │   ├── providers/                 # Provider setup
│   │   ├── routes/                    # GoRouter configuration
│   │   └── translation/               # Localization
│   │
│   ├── core/                          # Core utilities
│   │   ├── constants/                 # App constants & API config
│   │   ├── data_network/              # API client & networking
│   │   ├── extensions/                # Dart extensions
│   │   ├── services/                  # Generic services
│   │   └── shared/                    # Shared widgets & utilities
│   │
│   └── features/                      # Feature modules
│       ├── watch/                     # Upcoming movies
│       ├── search_movie/              # Movie search
│       ├── movies/                    # Movie details & trailers
│       ├── booking/                   # Seat selection & bookings
│       ├── dashboard/                 # Dashboard screen
│       ├── media_library/            # Media library
│       ├── more/                      # More screen
│       └── home/                      # Bottom navigation
│
│       Each feature follows Clean Architecture:
│       ├── data/                      # Data layer
│       │   ├── models/                # Data models
│       │   └── repositories/          # Repository implementations
│       ├── domain/                    # Domain layer
│       │   ├── entities/              # Business entities
│       │   ├── repositories/          # Repository interfaces
│       │   └── use_cases/             # Business logic
│       └── presentation/              # Presentation layer
│           ├── screens/               # Screen widgets
│           ├── views/                 # View widgets
│           ├── view_models/           # State management
│           └── widgets/               # Feature-specific widgets
```

## Tech Stack

- **Framework**: Flutter 3.10.7+
- **State Management**: Provider
- **Navigation**: GoRouter
- **Dependency Injection**: GetIt
- **Networking**: Dio
- **Local Database**: Floor (SQLite)
- **Video Player**: YouTube Player Flutter
- **Image Caching**: Cached Network Image
- **UI**: Material Design 3, Google Fonts, SVG Icons, 


## API Integration

- **Base URL**: `https://api.themoviedb.org/3/`
- **Endpoints**:
  - Upcoming movies
  - Movie search
  - Movie details
  - Movie images
  - Movie videos/trailers
  - Movie genres

## Getting Started

1. **Install dependencies**:
   ```bash
   flutter pub get
   ```

2. **Run the app**:
   ```bash
   flutter run
   ```

## Project Structure Highlights

- **Clean Architecture**: Separation of data, domain, and presentation layers
- **Repository Pattern**: Abstraction between data sources and business logic
- **Use Cases**: Encapsulated business logic per feature
- **Dependency Injection**: Centralized dependency management
- **Error Handling**: Comprehensive error handling with custom widgets
- **State Management**: Provider-based reactive state management
- **Routing**: Declarative routing with GoRouter
