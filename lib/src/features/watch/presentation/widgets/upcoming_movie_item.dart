import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/cached_network_image_widget.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/widgets/custom_svg_icon.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';

/// Upcoming movie item widget
class UpcomingMovieItem extends StatelessWidget {
  const UpcomingMovieItem({
    super.key,
    required this.upcomingMovie,
    required this.onTap,
  });

  final MovieEntity? upcomingMovie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Stack(

          children: [
            AppCachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: injectedImageHelper.getPosterUrl(
                upcomingMovie?.posterPath,
                width: 780,
              ),
              width: double.infinity,
              height: 150,
              errorWidget: (context, url, error) => Container(
                //width: 100,
                height: 150,
                color: injectedAppColors.greyColor,
                child: CustomSvgIcon(iconPath: injectedAppIcons.watchIcon),
              ),
            ),
            Positioned(
              bottom: 5,
              left: 5,
              child: Text(
                upcomingMovie?.title ?? "",
                style: injectedTextStyles.semiBold14.copyWith(
                  color: injectedAppColors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
