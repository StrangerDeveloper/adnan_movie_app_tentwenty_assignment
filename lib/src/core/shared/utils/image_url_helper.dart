class ImageUrlHelper {
  final String baseImageUrl = 'https://image.tmdb.org/t/p';

  /// Get poster image URL with specified width
  /// Default width is 500px
  String getPosterUrl(String? posterPath, {int width = 500}) {
    if (posterPath == null || posterPath.isEmpty) {
      return '';
    }
    return '$baseImageUrl/w$width$posterPath';
  }

  /// Get backdrop image URL with specified width
  /// Default width is 1280px
  String getBackdropUrl(String? backdropPath, {int width = 1280}) {
    if (backdropPath == null || backdropPath.isEmpty) {
      return '';
    }
    return '$baseImageUrl/w$width$backdropPath';
  }

  /// Get profile image URL with specified width
  /// Default width is 185px
  String getProfileUrl(String? profilePath, {int width = 185}) {
    if (profilePath == null || profilePath.isEmpty) {
      return '';
    }
    return '$baseImageUrl/w$width$profilePath';
  }
}
