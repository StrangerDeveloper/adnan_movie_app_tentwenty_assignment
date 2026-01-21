import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/presentation/screens/movie_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/booking/presentation/screens/bookings_screen.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/booking/presentation/screens/seat_selection_screen.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/home/presentation/screens/home_screen.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/presentation/screens/movie_detail_screen.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/presentation/screens/trailer_player_screen.dart';

class AppRouter {
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: '/watch',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          // Determine selected index based on current route for initial navigation
          int? selectedIndex;
          final path = state.uri.path;
          if (path == '/dashboard') {
            selectedIndex = 0;
          } else if (path == '/watch') {
            selectedIndex = 1;
          } else if (path == '/media-library') {
            selectedIndex = 2;
          } else if (path == '/more') {
            selectedIndex = 3;
          }

          return HomeScreen(selectedIndex: selectedIndex);
        },
        routes: [
          // These routes are kept for deep linking, but navigation is handled by IndexedStack
          GoRoute(
            path: '/dashboard',
            builder: (context, state) => const SizedBox.shrink(),
          ),
          GoRoute(
            path: '/watch',
            builder: (context, state) => const SizedBox.shrink(),
          ),
          GoRoute(
            path: '/media-library',
            builder: (context, state) => const SizedBox.shrink(),
          ),
          GoRoute(
            path: '/more',
            builder: (context, state) => const SizedBox.shrink(),
          ),
        ],
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const MovieSearchScreen(),
      ),
      GoRoute(
        path: '/movie/:id',
        builder: (context, state) {
          final movieId = int.parse(state.pathParameters['id']!);
          return MovieDetailScreen(movieId: movieId);
        },
      ),
      GoRoute(
        path: '/trailer/:videoKey',
        builder: (context, state) {
          final videoKey = state.pathParameters['videoKey']!;
          return TrailerPlayerScreen(videoKey: videoKey);
        },
      ),
      GoRoute(
        path: '/booking',
        builder: (context, state) => const SeatSelectionScreen(),
      ),
      GoRoute(
        path: '/bookings',
        builder: (context, state) => const BookingsScreen(),
      ),
    ],
  );
}
