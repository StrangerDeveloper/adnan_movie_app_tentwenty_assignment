import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/api_response_type/app_api_response.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/domain/use_case/use_case.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/entities/movie_entity.dart';

import '../repositories/movie_repository.dart';

class GetMovieDetailsUseCase implements UseCase<AppApiResponse<MovieEntity?>, Map<String, dynamic>> {
  final MovieRepository repository;

  GetMovieDetailsUseCase({required this.repository});

  @override
  Future<AppApiResponse<MovieEntity?>> call({Map<String, dynamic>? params}) async {



    return await repository.getMovieDetails(params: params);
  }
}
