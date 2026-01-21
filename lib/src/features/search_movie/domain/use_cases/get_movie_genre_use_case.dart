import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/api_response_type/app_api_response.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/domain/use_case/use_case.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/domain/entities/genre_entity.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/domain/repositories/search_repository.dart';

class GetMovieGenresUseCase implements UseCase<AppApiListResponse<GenreEntity?>, Map<String, dynamic>> {
  final SearchRepository repository;

  GetMovieGenresUseCase({required this.repository});

  @override
  Future<AppApiListResponse<GenreEntity?>> call({Map<String, dynamic>? params}) async {
    return await repository.getGenres(params: params);
  }
}
