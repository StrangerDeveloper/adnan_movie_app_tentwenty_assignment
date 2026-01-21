import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/presentation/view_models/movie_search_view_model.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/presentation/widgets/movie_search_item.dart';
import 'package:flutter/material.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/error_widget.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/loading_indicator.dart';

/// View for displaying search results
class MovieSearchView extends StatelessWidget {
  final Function(int? movieId) onMovieTap;
  final MovieSearchViewModel viewModel;

  const MovieSearchView({
    super.key,
    required this.onMovieTap,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    if (viewModel.state == MovieSearchState.loading &&
        viewModel.movies.isEmpty) {
      return const LoadingIndicator();
    }

    if (viewModel.state == MovieSearchState.error && viewModel.movies.isEmpty) {
      return AppErrorWidget(
        message:
            viewModel.errorMessage ??
            injectedAppTranslationKeys.failedToSearchMovies.translate,
        onRetry: () => viewModel.search(viewModel.query),
      );
    }

    if (viewModel.movies.isEmpty && viewModel.query.isNotEmpty) {
      return Center(
        child: Text(
          injectedAppTranslationKeys.noMoviesFound.translate,
          style: injectedTextStyles.regular16,
        ),
      );
    }

    if (viewModel.query.isEmpty) {
      return Center(
        child: Text(
          injectedAppTranslationKeys.searchForMovies.translate,
          style: injectedTextStyles.regular16,
        ),
      );
    }

    return Column(
      children: [
        // Results count header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Text(
                '${viewModel.movies.length} ${injectedAppTranslationKeys.resultsFound.translate}',
                style: injectedTextStyles.semiBold16,
              ),
            ],
          ),
        ),
        // Results list
        Expanded(
          child: ListView.builder(
            itemCount: viewModel.movies.length + (viewModel.hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == viewModel.movies.length) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: TextButton(
                      onPressed: () => viewModel.loadMore(),
                      child: Text(
                        injectedAppTranslationKeys.loadMore.translate,
                      ),
                    ),
                  ),
                );
              }

              final movie = viewModel.movies[index];
              return MovieSearchItem(
                movie: movie,
                onTap: () => onMovieTap(movie?.id),
              );
            },
          ),
        ),
      ],
    );
  }
}
