import 'package:adnan_movie_app_tentwenty_assignment/src/core/constants/api_constants/api_constants.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/api_response_type/api_list_response.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/api_response_type/app_api_response.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/remote/api_client/api_client.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/remote/api_methods/api_methods.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/remote/api_route/api_route.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/data/models/movie_model.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/entities/movie_entity.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/repositories/watch_repository.dart';

class WatchRepositoryImpl implements WatchRepository {
  final APIClient apiClient;
  final ApiConstants apiConstants;

  WatchRepositoryImpl({required this.apiClient, required this.apiConstants});

  @override
  Future<AppApiListResponse<MovieEntity?>> getUpcomingMovies({Map<String, dynamic>? params}) async {
    final config = ApiRoute(
      path: apiConstants.upComingMovies,
      method: ApiMethods.get,
      headers: apiConstants.getDefaultHeaders(),
      params: params,
    );

    return await apiClient.request<ApiListResponse<MovieEntity?>>(
      config: config,
      create: () => ApiListResponse<MovieModel>(create: () => MovieModel()),
    );
  }
}
