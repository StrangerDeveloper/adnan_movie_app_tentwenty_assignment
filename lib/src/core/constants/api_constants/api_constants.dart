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
  final String apiKey = "5012dcb7da915ea1eec18f2e18b8211c";

  /* ------------------------------- Api Key ------------------------------ */
  final String accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MDEyZGNiN2RhOTE1ZWExZWVjMThmMmUxOGI4MjExYyIsIm5iZiI6MTc2ODgzODg2My45NjcsInN1YiI6IjY5NmU1NmNmMWJmMDVhYmI4ZGRjYmI4YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Dg5hk2Zc_T_EJc6nH3J0Wy0XnXOvJviUZ3U8AOJimGk";

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
