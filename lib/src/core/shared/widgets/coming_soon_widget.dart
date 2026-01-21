import 'package:flutter/material.dart';

import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';

/// Reusable widget for displaying "Coming Soon" message
class ComingSoonWidget extends StatelessWidget {
  final IconData icon;
  final String? title;
  final String? message;

  const ComingSoonWidget({
    super.key,
    required this.icon,
    this.title,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: injectedAppColors.greyColor),
          const SizedBox(height: 16),
          Text(
            title ?? injectedAppTranslationKeys.comingSoon.translate,
            style: injectedTextStyles.semiBold20.copyWith(
              color: injectedAppColors.greyColor,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              message ?? injectedAppTranslationKeys.comingSoonMessage.translate,
              style: injectedTextStyles.regular14.copyWith(
                color: injectedAppColors.greyColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
