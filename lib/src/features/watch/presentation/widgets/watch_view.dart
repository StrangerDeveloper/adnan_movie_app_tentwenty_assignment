import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/presentation/view_models/watch_view_model.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/presentation/widgets/upcoming_movie_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// View for Watch screen
class WatchView extends StatelessWidget {
  const WatchView({super.key, required this.viewModel});

  final WatchViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: viewModel.upcomingMovies.length,
      itemBuilder: (context, index) {
        final movie = viewModel.upcomingMovies[index];
        return UpcomingMovieItem(
          upcomingMovie: movie,
          onTap: () {
            context.push('/movie/${movie?.id}');
          },
        );
      },
    );
  }
}
