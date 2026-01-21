import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/base_widget.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../views/home_view.dart';

class HomeScreen extends StatelessWidget {
  final int? selectedIndex;

  const HomeScreen({super.key, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      showAppBar: false,
      //resizeToAvoidBottomPadding: false,
      canPop: false,
      bottomNavigationBar: const AppBottomNavigationBar(),
      child: const HomeView(),
    );
  }
}
