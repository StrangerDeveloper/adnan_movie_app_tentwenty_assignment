import 'package:flutter/material.dart';

import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/base_change_notifier_provider.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/base_widget.dart';
import '../viewmodels/more_viewmodel.dart';
import '../views/more_view.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseChangeNotifierProvider<MoreViewModel>(
      create: (_) => MoreViewModel(),
      builder: (context, viewModel) {
        return BaseWidget(
          appBarTitle: injectedAppTranslationKeys.more.translate,
          child: const MoreView(),
        );
      },
    );
  }
}
