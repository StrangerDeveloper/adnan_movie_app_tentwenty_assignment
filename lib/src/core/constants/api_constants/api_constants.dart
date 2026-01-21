// ignore_for_file: unused_field

class ApiConstants {
  ///
  /// Active base url for the application
  ///
  String get baseUrl => "https://api.themoviedb.org/3/";

  /* -------------------------------------------------------------------------- */
  /*                                  CONSTANTS                                 */
  /* -------------------------------------------------------------------------- */
  Map<String, dynamic> getDefaultHeaders() {
    return {'Authorization': 'Bearer $accessToken'};
  }

  /* ------------------------------- Api Key ------------------------------ */
  final String apiKey = "YOUR_API_KEY";

  /* ------------------------------- Api Key ------------------------------ */
  final String accessToken = "YOUR_ACCESS_TOKEN"
  /* -------------------------------------------------------------------------- */
  /*                                API ENDPOINTS                               */
  /* -------------------------------------------------------------------------- */

  /* ------------------------------- UP COMING MOVIES ------------------------------ */
  final String upComingMovies = 'movie/upcoming';

  /* ------------------------------- GENRE MOVIES ------------------------------ */
  final String getMovieGenres = 'genre/movie/list';

  /* ------------------------------- SEARCH MOVIES ------------------------------ */
  final String searchMovie = 'search/movie';

  /* ------------------------------- GET MOVIE DETAILS ------------------------------ */
  final String getMovieDetails = 'movie/:id';

  /* ------------------------------- GET MOVIE IMAGES ------------------------------ */
  final String getImages = 'movie/:id/images';

  /* ------------------------------- GET MOVIE VIDEOS ------------------------------ */
  final String getMovieVideos = 'movie/:id/videos';
}
