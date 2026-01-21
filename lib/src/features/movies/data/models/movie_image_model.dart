import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/domain/entities/movie_image_entity.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/decoder/decoder.dart';

class MovieImageModel extends MovieImageEntity implements Decodable<MovieImageModel> {
  const MovieImageModel({
    super.aspectRatio,
    super.height,
    super.iso6391,
    super.filePath,
    super.voteAverage,
    super.voteCount,
    super.width,
  });

  factory MovieImageModel.fromJson(Map<String, dynamic> json) {
    return MovieImageModel(
      aspectRatio: (json['aspect_ratio'] as num?)?.toDouble(),
      height: json['height'] as int?,
      iso6391: json['iso_639_1'] as String?,
      filePath: json['file_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      width: json['width'] as int?,
    );
  }

  @override
  MovieImageModel decode(dynamic json) {
    return MovieImageModel.fromJson(json as Map<String, dynamic>);
  }
}
