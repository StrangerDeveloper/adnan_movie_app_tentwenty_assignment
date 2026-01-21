import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/cached_network_image_widget.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/entities/movie_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/utils/date_formatter.dart';

class MovieDetailHeader extends StatelessWidget {
  final MovieEntity? movie;

  const MovieDetailHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Backdrop image
        if (movie?.backdropPath?.isNotEmpty == true)
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: injectedImageHelper.getBackdropUrl(
                    movie?.backdropPath,
                  ),
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: injectedAppColors.greyColor,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: injectedAppColors.greyColor,
                    child: const Icon(Icons.movie_outlined, size: 64),
                  ),
                ),
                // Gradient overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, injectedAppColors.white],
                    ),
                  ),
                ),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Poster
              AppCachedNetworkImage(
                imageUrl: injectedImageHelper.getPosterUrl(
                  movie?.posterPath ?? "",
                  width: 500,
                ),
                width: 120,
                height: 180,
              ),
              const SizedBox(width: 16),
              // Title and info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie?.title ?? "", style: injectedTextStyles.bold20),
                    const SizedBox(height: 8),
                    if (movie?.releaseDate?.isNotEmpty == true)
                      Text(
                        DateFormatter.formatDateString(movie?.releaseDate),
                        style: injectedTextStyles.regular14.copyWith(
                          color: injectedAppColors.greyColor,
                        ),
                      ),
                    if (movie?.voteAverage != null) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, size: 20, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            '${movie?.voteAverage!.toStringAsFixed(1)} / 10',
                            style: injectedTextStyles.regular16,
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
