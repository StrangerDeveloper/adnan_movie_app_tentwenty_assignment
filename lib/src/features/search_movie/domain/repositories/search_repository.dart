import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/api_response_type/app_api_response.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/domain/entities/genre_entity.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/entities/movie_entity.dart';

abstract class SearchRepository {
  Future<AppApiListResponse<MovieEntity?>> searchMovies({Map<String, dynamic>? params});

  Future<AppApiListResponse<GenreEntity?>> getGenres({Map<String, dynamic>? params});
}

