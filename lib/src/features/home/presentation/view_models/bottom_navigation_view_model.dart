import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:adnan_movie_app_tentwenty_assignment/src/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/media_library/presentation/screens/media_library_screen.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/more/presentation/screens/more_screen.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/presentation/screens/watch_screen.dart';
import '../ui_models/navigation_bar_item.dart';

/// [BottomNavBarViewModel] class to hold the bottom navigation bar data
class BottomNavBarViewModel extends ChangeNotifier {
  /* -------------------------------------------------------------------------- */
  /*                                  VARIABLES                                 */
  /* -------------------------------------------------------------------------- */

  /// [bottomNavBarIndex] instance to hold the index of the bottom navigation bar
  ValueNotifier<int> bottomNavBarIndex = ValueNotifier<int>(
    1,
  ); // Default to watch (index 1)

  /// List to hold the navigation bar items, with lazy loading and caching.
  List<NavigationBarItem>? _navigationBarItems;

  /// List to hold the navigation widgets, with lazy loading and caching.
  List<Widget>? _navigationViews;

  /* -------------------------------------------------------------------------- */
  /*                                   METHODS                                  */
  /* -------------------------------------------------------------------------- */

  /// Static method to get the instance from context
  static BottomNavBarViewModel of(BuildContext context) {
    return context.read<BottomNavBarViewModel>();
  }

  /// Method to change the bottom navigation bar view
  void changeBottomNavBarView(int index) {
    bottomNavBarIndex.value = index;
    //notifyListeners();
    // log the bottom navigation bar event to the analytics
    //_logBottomNavBarEvent(index);
  }

  ///
  /// Getter to get the navigation bar items
  ///
  List<NavigationBarItem> _getNavigationBarItems() {
    List<NavigationBarItem> items = [
      NavigationBarItem(
        iconPath: injectedAppIcons.dashboardIcon,
        label: injectedAppTranslationKeys.dashboard.translate,
      ),
      NavigationBarItem(
        iconPath: injectedAppIcons.watchIcon,
        label: injectedAppTranslationKeys.watch.translate,
      ),
      NavigationBarItem(
        iconPath: injectedAppIcons.mediaLibIcon,
        label: injectedAppTranslationKeys.mediaLib.translate,
      ),
      NavigationBarItem(
        iconPath: injectedAppIcons.moreIcon,
        label: injectedAppTranslationKeys.more.translate,
      ),
    ];
    return items;
  }

  /// Method to get the navigation bar items, with lazy loading and caching.
  List<NavigationBarItem> get navigationBarItems {
    _navigationBarItems ??= _getNavigationBarItems();
    return _navigationBarItems!;
  }

  /// Getter to retrieve the list of navigation widgets for the bottom navigation bar.
  List<Widget> get navigationViews {
    _navigationViews ??= [
      // Dashboard screen
      const DashboardScreen(),
      // Watch screen
      const WatchScreen(),
      // Media Library screen
      const MediaLibraryScreen(),
      // More screen
      const MoreScreen(),
    ];
    return _navigationViews!;
  }

  /// Get the current selected index
  int get currentIndex => bottomNavBarIndex.value;

  /// Clear the bottom navigation view model
  void clear() {
    bottomNavBarIndex.value = 0;
    _navigationBarItems = null; // Clear cached items
    _navigationViews = null; // Clear cached widgets
    notifyListeners();
  }

  @override
  void dispose() {
    bottomNavBarIndex.dispose();
    clear();
    super.dispose();
  }
}
