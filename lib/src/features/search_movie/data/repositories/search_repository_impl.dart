import 'package:adnan_movie_app_tentwenty_assignment/src/core/constants/api_constants/api_constants.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/api_response_type/api_list_response.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/api_response_type/app_api_response.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/remote/api_client/api_client.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/remote/api_methods/api_methods.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/remote/api_route/api_route.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/data/models/genre_model.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/domain/entities/genre_entity.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/domain/repositories/search_repository.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/data/models/movie_model.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/entities/movie_entity.dart';

class SearchRepositoryImpl implements SearchRepository {
  final APIClient apiClient;
  final ApiConstants apiConstants;

  SearchRepositoryImpl({required this.apiClient, required this.apiConstants});

  @override
  Future<AppApiListResponse<MovieEntity?>> searchMovies({Map<String, dynamic>? params}) async {
    final config = ApiRoute(
      path: apiConstants.searchMovie,
      method: ApiMethods.get,
      headers: apiConstants.getDefaultHeaders(),
      params: params,
    );

    return await apiClient.request<ApiListResponse<MovieEntity?>>(
      config: config,
      create: () => ApiListResponse<MovieModel>(create: () => MovieModel()),
    );
  }

  @override
  Future<AppApiListResponse<GenreEntity?>> getGenres({Map<String, dynamic>? params}) async {
    final config = ApiRoute(
      path: apiConstants.getMovieGenres,
      method: ApiMethods.get,
      headers: apiConstants.getDefaultHeaders(),
      params: params,
    );

    return await apiClient.request<ApiListResponse<GenreEntity?>>(
      config: config,
      create: () => ApiListResponse<GenreModel>(create: () => GenreModel()),
    );
  }
}
