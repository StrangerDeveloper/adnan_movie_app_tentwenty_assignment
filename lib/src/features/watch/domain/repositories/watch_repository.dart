import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/api_response_type/app_api_response.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/entities/movie_entity.dart';

abstract class WatchRepository {
  /// Get list of upcoming movies
  Future<AppApiListResponse<MovieEntity?>> getUpcomingMovies({Map<String, dynamic>? params});
}