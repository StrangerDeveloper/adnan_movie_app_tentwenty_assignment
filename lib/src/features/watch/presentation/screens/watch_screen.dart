import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/presentation/view_models/watch_view_model.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/presentation/widgets/watch_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/base_change_notifier_provider.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/base_widget.dart';

/// Watch screen - displays the movie list
class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseChangeNotifierProvider<WatchViewModel>(
      create: (_) => WatchViewModel(),
      builder: (context, watchViewModel) {
        return BaseWidget(
          appBarTitle: injectedAppTranslationKeys.watch.translate,
          appBarActions: [IconButton(icon: const Icon(Icons.search), onPressed: () => context.go('/search'))],
          child: WatchView(viewModel: watchViewModel),
        );
      },
    );
  }
}
