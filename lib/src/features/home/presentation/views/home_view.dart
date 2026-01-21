import 'package:adnan_movie_app_tentwenty_assignment/src/features/home/presentation/view_models/bottom_navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// View for Home screen
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarViewModel>(
      builder: (context, bottomNavBarViewModel, child) => ValueListenableBuilder(
        valueListenable: bottomNavBarViewModel.bottomNavBarIndex,
        builder: (context, index, child) => IndexedStack(index: index, children: bottomNavBarViewModel.navigationViews),
      ),
    );
  }
}
