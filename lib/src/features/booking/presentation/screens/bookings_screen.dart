import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/custom_svg_icon.dart';
import 'package:flutter/material.dart';

import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/base_widget.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BaseWidget(
      appBarTitle: injectedAppTranslationKeys.myBookings.translate,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgIcon(
              iconPath: injectedAppIcons.seatIcon,
              width: 10,
              height: 12,
              color: theme.colorScheme.primary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              injectedAppTranslationKeys.noBookingsYet.translate,
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              injectedAppTranslationKeys
                  .yourMovieBookingsWillAppearHere
                  .translate,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
