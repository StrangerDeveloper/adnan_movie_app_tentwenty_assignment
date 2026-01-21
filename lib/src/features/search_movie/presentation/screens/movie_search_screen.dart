import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/base_change_notifier_provider.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/presentation/views/movie_genre_view.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/presentation/views/movie_search_view.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/presentation/widgets/search_bar_widget.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/presentation/view_models/movie_search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/base_widget.dart';

/// Movie Search screen - displays genres or search results
class MovieSearchScreen extends StatelessWidget {
  const MovieSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseChangeNotifierProvider<MovieSearchViewModel>(
      create: (_) => MovieSearchViewModel(),
      builder: (context, viewModel) {
        return BaseWidget(
          appBarTitle: injectedAppTranslationKeys.searchMovies.translate,
          
          child: Column(
            children: [
              SearchBarWidget(
                controller: viewModel.searchController,
                onChanged: viewModel.onSearchChanged,
                onClear: viewModel.clear,
              ),
              Expanded(
                child: viewModel.isSearching
                    ? MovieSearchView(
                        viewModel: viewModel,
                        onMovieTap: (movieId) {
                          context.push('/movie/$movieId');
                        },
                      )
                    : MovieGenreView(viewModel: viewModel),
              ),
            ],
          ),
        );
      },
    );
  }
}
