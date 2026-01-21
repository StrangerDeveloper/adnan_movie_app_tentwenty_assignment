import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/base_change_notifier_provider.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../view_models/movie_detail_view_model.dart';
import '../views/movie_detail_view.dart';


class MovieDetailScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BaseChangeNotifierProvider<MovieDetailViewModel>(
      create: (context) => MovieDetailViewModel(movieId: movieId),
      builder: (context, viewModel) => BaseWidget(
        appBarTitle: injectedAppTranslationKeys.movieDetails.translate,
        appBarLeading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => context.pop()),
        child: MovieDetailView(
          viewModel: viewModel,
          onWatchTrailer: (videoKey) {
            context.push('/trailer/$videoKey');
          },
          onBookTickets: () {
            context.push('/booking');
          },
        ),
      ),
    );
  }
}
