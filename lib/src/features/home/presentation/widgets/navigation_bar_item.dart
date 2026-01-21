import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/custom_svg_icon.dart';
import 'package:flutter/material.dart';

BottomNavigationBarItem buildNavigationBarItem({
  required String iconPath,
  required String label,
  bool isActive = false,
}) {
  return BottomNavigationBarItem(
    icon: CustomSvgIcon(
      iconPath: iconPath,
      width: 16.0,
      height: 16.0,
      color: isActive ? injectedAppColors.selectedItemColor : injectedAppColors.unSelectedItemColor,
    ),
    label: label,
  );
}
