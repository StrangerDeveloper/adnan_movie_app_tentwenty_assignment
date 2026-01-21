import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/presentation/view_models/movie_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/error_widget.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/loading_indicator.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/presentation/widgets/genre_chips_widget.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/presentation/widgets/watch_movie_detail_header.dart';

class MovieDetailView extends StatelessWidget {
  final Function(String? videoKey) onWatchTrailer;
  final VoidCallback? onBookTickets;
  final MovieDetailViewModel viewModel;

  const MovieDetailView({super.key, required this.viewModel, required this.onWatchTrailer, this.onBookTickets});

  @override
  Widget build(BuildContext context) {
    if (viewModel.state == MovieDetailState.loading) {
      return const LoadingIndicator();
    }

    if (viewModel.state == MovieDetailState.error) {
      return AppErrorWidget(
        message: viewModel.errorMessage ?? injectedAppTranslationKeys.failedToLoadMovieDetails.translate,
        onRetry: () {
          // Retry logic would need movieId, handled by screen
        },
      );
    }

    if (viewModel.movie == null) {
      return const SizedBox.shrink();
    }

    final movieGenres = viewModel.getMovieGenres();


    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie header with backdrop, title, and release date
          WatchMovieDetailHeader(viewModel: viewModel, movie: viewModel.movie, onWatchTrailer: onWatchTrailer, onBookTickets: onBookTickets),
          const SizedBox(height: 24),

          // Genres section
          if (movieGenres.isNotEmpty) GenreChipsWidget(genres: movieGenres),
          const SizedBox(height: 24),
          // Overview section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Text(injectedAppTranslationKeys.overview.translate, style: injectedTextStyles.semiBold16),
                if (viewModel.movie?.overview?.isNotEmpty == true)
                  Text(viewModel.movie?.overview ?? "", style: injectedTextStyles.regular14),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
