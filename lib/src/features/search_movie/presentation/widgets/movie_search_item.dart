import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/cached_network_image_widget.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';

/// Movie search item widget
class MovieSearchItem extends StatelessWidget {
  final MovieEntity? movie;
  final VoidCallback onTap;

  const MovieSearchItem({super.key, required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Poster
            AppCachedNetworkImage(
              imageUrl: injectedImageHelper.getPosterUrl(
                movie?.posterPath,
                width: 200,
              ),
              width: 80,
              height: 120,
            ),
            const SizedBox(width: 16),
            // Movie info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie?.title ?? "",
                    style: injectedTextStyles.semiBold14,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  if (movie?.releaseDate != null)
                    Text(
                      movie?.releaseDate ?? "",
                      style: injectedTextStyles.regular10,
                    ),
                  if (movie?.voteAverage != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, size: 14, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(
                          movie?.voteAverage?.toStringAsFixed(1) ?? "",
                          style: injectedTextStyles.regular10,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
