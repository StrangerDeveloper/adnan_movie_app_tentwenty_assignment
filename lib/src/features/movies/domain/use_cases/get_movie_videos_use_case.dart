import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/api_response_type/app_api_response.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/domain/use_case/use_case.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/data/models/movie_video_response_model.dart';

import '../repositories/movie_repository.dart';

class GetMovieVideosUseCase
    implements
        UseCase<AppApiResponse<MovieVideoResponseModel>, Map<String, dynamic>> {
  final MovieRepository repository;

  GetMovieVideosUseCase({required this.repository});

  @override
  Future<AppApiResponse<MovieVideoResponseModel>> call({
    Map<String, dynamic>? params,
  }) async {
    return await repository.getMovieVideos(params: params);
  }
}
