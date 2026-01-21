import 'dart:async';

import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/api_response_type/app_api_response.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/data/models/movie_images_response_model.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/data/models/movie_video_response_model.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  /// Get movie details by ID
  Future<AppApiResponse<MovieEntity?>> getMovieDetails({Map<String, dynamic>? params});

  /// Watch movie details by ID (reactive stream)
  //Stream<Movie?> watchMovieDetails(int movieId);

  /// Get movie videos/trailers by movie ID
  Future<AppApiResponse<MovieVideoResponseModel>> getMovieVideos({Map<String, dynamic>? params});

  /// Get movie images by movie ID
  Future<AppApiResponse<MovieImagesResponseModel>> getMovieImages({Map<String, dynamic>? params});
}
