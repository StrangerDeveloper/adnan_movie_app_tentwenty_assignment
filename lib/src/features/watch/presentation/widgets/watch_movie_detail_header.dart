import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/app_button.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/presentation/view_models/movie_detail_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/entities/movie_entity.dart';

/// Watch movie detail header widget with backdrop, title, and release date
class WatchMovieDetailHeader extends StatelessWidget {
  final MovieEntity? movie;
  final Function(String? videoKey) onWatchTrailer;
  final VoidCallback? onBookTickets;
  final MovieDetailViewModel viewModel;

  const WatchMovieDetailHeader({
    super.key,
    required this.movie,
    required this.onWatchTrailer,
    this.onBookTickets,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    if (movie == null) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 450,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Backdrop image
          if (movie?.backdropPath != null)
            CachedNetworkImage(
              imageUrl: injectedImageHelper.getBackdropUrl(movie?.backdropPath),
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: injectedAppColors.greyColor,
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) =>
                  Container(color: injectedAppColors.greyColor, child: const Icon(Icons.movie_outlined, size: 64)),
            )
          else
            Container(color: injectedAppColors.greyColor),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withValues(alpha: 0.6)],
              ),
            ),
          ),
          // Movie title and release date
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                // Movie title in golden color
                Text(
                  movie?.title ?? '',
                  style: injectedTextStyles.bold28.copyWith(
                    color: const Color(0xFFD4AF37), // Golden color
                  ),
                ),
                const SizedBox(height: 8),
                // Release date
                if (movie?.releaseDate != null)
                  Text(
                    'In Theaters ${_formatReleaseDate(movie!.releaseDate!)}',
                    style: injectedTextStyles.regular16.copyWith(color: injectedAppColors.white),
                  ),
                const SizedBox(height: 8),
                // Action buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      // Get Tickets button
                      AppButton(
                        width: 250,
                        text: injectedAppTranslationKeys.bookTickets.translate,
                        onPressed: onBookTickets,
                        backgroundColor: injectedAppColors.regularSeatColor,
                        // Light blue
                        textColor: injectedAppColors.white,
                        borderRadius: 8,
                      ),
                      //const SizedBox(width: 12),
                      // Watch Trailer button
                      AppButton(
                        width: 250,
                        text: injectedAppTranslationKeys.watchTrailer.translate,
                        onPressed: viewModel.trailerVideo != null
                            ? () => onWatchTrailer(viewModel.trailerVideo?.key!)
                            : null,
                        isOutlined: true,
                        borderColor: injectedAppColors.white,
                        textColor: injectedAppColors.white,
                        borderRadius: 8,
                        icon: Icon(Icons.play_arrow, color: injectedAppColors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatReleaseDate(String date) {
    try {
      final dateTime = DateTime.parse(date);
      final months = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ];
      return '${months[dateTime.month - 1]} ${dateTime.day}, ${dateTime.year}';
    } catch (e) {
      return date;
    }
  }
}
