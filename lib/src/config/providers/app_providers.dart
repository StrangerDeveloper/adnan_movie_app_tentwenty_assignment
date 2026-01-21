import 'package:adnan_movie_app_tentwenty_assignment/src/features/home/presentation/view_models/bottom_navigation_view_model.dart';
import 'package:provider/provider.dart';

/// Global providers that are used across the entire app
/// These ViewModels should be available throughout the app lifecycle
class AppProviders {
  /// Get list of global providers
  static List<ChangeNotifierProvider> get providers => [
    // Bottom Navigation ViewModel - used globally for navigation state
    ChangeNotifierProvider<BottomNavBarViewModel>(create: (_) => BottomNavBarViewModel()),
  ];
}
