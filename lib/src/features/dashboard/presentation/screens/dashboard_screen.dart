import 'package:flutter/material.dart';

import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/base_change_notifier_provider.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/base_widget.dart';
import '../viewmodels/dashboard_viewmodel.dart';
import '../views/dashboard_view.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseChangeNotifierProvider<DashboardViewModel>(
      create: (_) => DashboardViewModel(),
      builder: (context, viewModel) {
        return BaseWidget(
          appBarTitle: injectedAppTranslationKeys.dashboard.translate,
          child: const DashboardView(),
        );
      },
    );
  }
}
