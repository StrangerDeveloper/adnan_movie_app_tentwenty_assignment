import 'package:flutter/material.dart';

import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/coming_soon_widget.dart';

/// View for Media Library screen
class MediaLibraryView extends StatelessWidget {
  const MediaLibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComingSoonWidget(icon: Icons.library_books_outlined);
  }
}
