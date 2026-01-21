import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/cached_network_image_widget.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/domain/entities/genre_entity.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/presentation/view_models/movie_search_view_model.dart';
import 'package:flutter/material.dart';

/// View for displaying movie genres in a grid layout
class MovieGenreView extends StatelessWidget {
  final MovieSearchViewModel viewModel;

  const MovieGenreView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    if (viewModel.genres.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: viewModel.genres.length,
      itemBuilder: (context, index) {
        final genre = viewModel.genres[index];
        return GenreItem(genre: genre);
      },
    );
  }
}

/// Individual genre item widget
class GenreItem extends StatelessWidget {
  final GenreEntity? genre;

  const GenreItem({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    // Placeholder image URL - replace with actual genre images if available
    final imageUrl =
        'https://via.placeholder.com/300x400?text=${genre?.name ?? ''}';

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          AppCachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            borderRadius: 12,
          ),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.7),
                ],
              ),
            ),
          ),
          // Genre name
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Text(
              genre?.name ?? '',
              style: injectedTextStyles.bold20.copyWith(
                color: injectedAppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
