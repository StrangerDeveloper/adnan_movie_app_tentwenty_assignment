import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/data/models/movie_video_model.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/decoder/decoder.dart';

/// TMDB API response structure for videos endpoint
class MovieVideoResponseModel implements Decodable<MovieVideoResponseModel> {
  final int? id;
  final List<MovieVideoModel> results;

  MovieVideoResponseModel({this.id, List<MovieVideoModel>? results})
    : results = results ?? [];

  factory MovieVideoResponseModel.fromJson(Map<String, dynamic> json) {
    return MovieVideoResponseModel(
      id: json['id'] as int?,
      results:
          (json['results'] as List<dynamic>?)
              ?.map(
                (item) =>
                    MovieVideoModel.fromJson(item as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );
  }

  @override
  MovieVideoResponseModel decode(dynamic json) {
    return MovieVideoResponseModel.fromJson(json as Map<String, dynamic>);
  }
}
