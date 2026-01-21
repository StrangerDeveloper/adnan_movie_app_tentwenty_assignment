import 'package:flutter/material.dart';

import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/app_button.dart';

class WatchTrailerButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const WatchTrailerButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: AppButton(
        text: injectedAppTranslationKeys.watchTrailer.translate,
        onPressed: onPressed,
        isLoading: isLoading,
        width: double.infinity,

        icon: const Icon(Icons.play_arrow),
      ),
    );
  }
}
