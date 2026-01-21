import 'package:flutter/material.dart';

import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/coming_soon_widget.dart';

/// View for More screen
class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComingSoonWidget(icon: Icons.more_horiz);
  }
}
