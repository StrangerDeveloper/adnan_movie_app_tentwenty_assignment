import 'package:flutter/material.dart';

import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/base_change_notifier_provider.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/base_widget.dart';
import '../viewmodels/media_library_viewmodel.dart';
import '../views/media_library_view.dart';

class MediaLibraryScreen extends StatelessWidget {
  const MediaLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseChangeNotifierProvider<MediaLibraryViewModel>(
      create: (_) => MediaLibraryViewModel(),
      builder: (context, viewModel) {
        return BaseWidget(
          appBarTitle: injectedAppTranslationKeys.mediaLib.translate,
          child: const MediaLibraryView(),
        );
      },
    );
  }
}
