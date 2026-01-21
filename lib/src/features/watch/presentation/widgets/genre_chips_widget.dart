import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:flutter/material.dart';

/// Genre chips widget with colored tags
class GenreChipsWidget extends StatelessWidget {
  final List<String?> genres;

  const GenreChipsWidget({super.key, required this.genres});

  // Color palette for genres
  List<Color> get _genreColors => [
    injectedAppColors.genreTeal,
    injectedAppColors.genrePink,
    injectedAppColors.genrePurple,
    injectedAppColors.genreOrange,
    injectedAppColors.genreBlue,
    injectedAppColors.genreGreen,
  ];

  @override
  Widget build(BuildContext context) {
    if (genres.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Genres', style: injectedTextStyles.semiBold16),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: genres.asMap().entries.map((entry) {
              final index = entry.key;
              final genre = entry.value;
              return _GenreChip(
                label: genre,
                color: _genreColors[index % _genreColors.length],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

/// Individual genre chip
class _GenreChip extends StatelessWidget {
  final String? label;
  final Color color;

  const _GenreChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label ?? "",
        style: injectedTextStyles.regular12.copyWith(
          color: injectedAppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
