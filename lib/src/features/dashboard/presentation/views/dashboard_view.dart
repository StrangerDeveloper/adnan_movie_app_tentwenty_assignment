import 'package:flutter/material.dart';

import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/coming_soon_widget.dart';

/// View for Dashboard screen
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComingSoonWidget(icon: Icons.dashboard_outlined);
  }
}
