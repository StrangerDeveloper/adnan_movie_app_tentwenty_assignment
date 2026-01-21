import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Reusable CachedNetworkImage widget with consistent styling
class AppCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;
  final Color? placeholderColor;
  final IconData? errorIcon;

  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 8,
    this.placeholder,
    this.errorWidget,
    this.placeholderColor,
    this.errorIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder:
            placeholder ??
            (context, url) => Container(
              width: width,
              height: height,
              color: placeholderColor ?? injectedAppColors.greyColor,
              child: const Center(child: CircularProgressIndicator()),
            ),
        errorWidget:
            errorWidget ??
            (context, url, error) => Container(
              width: width,
              height: height,
              color: placeholderColor ?? injectedAppColors.greyColor,
              child: Icon(
                errorIcon ?? Icons.movie_outlined,
                color: injectedAppColors.greyColor,
              ),
            ),
      ),
    );
  }
}
