import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/api_response_type/app_api_response.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/domain/use_case/use_case.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/entities/movie_entity.dart';

import '../repositories/watch_repository.dart';

class GetUpcomingMoviesUseCase implements UseCase<AppApiListResponse<MovieEntity?>, Map<String, dynamic>> {
  final WatchRepository repository;

  GetUpcomingMoviesUseCase({required this.repository});

  @override
  Future<AppApiListResponse<MovieEntity?>> call({Map<String, dynamic>? params}) async {
    return await repository.getUpcomingMovies(params: params);
  }
}
