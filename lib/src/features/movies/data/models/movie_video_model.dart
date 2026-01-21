import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/domain/entities/movie_video_entity.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/decoder/decoder.dart';

class MovieVideoModel extends MovieVideoEntity implements Decodable<MovieVideoModel> {
  const MovieVideoModel({
    super.id,
    super.key,
    super.name,
    super.site,
    super.size,
    super.type,
    super.official,
    super.publishedAt,
    super.iso6391,
    super.iso31661,
  });

  factory MovieVideoModel.fromJson(Map<String, dynamic> json) {
    return MovieVideoModel(
      id: json['id'] as String,
      key: json['key'] as String,
      name: json['name'] as String,
      site: json['site'] as String,
      size: json['size'] as int,
      type: json['type'] as String,
      official: json['official'] as bool? ?? false,
      publishedAt: json['published_at'] as String?,
      iso6391: json['iso_639_1'] as String?,
      iso31661: json['iso_3166_1'] as String?,
    );
  }

  @override
  MovieVideoModel decode(dynamic json) {
    return MovieVideoModel.fromJson(json as Map<String, dynamic>);
  }
}
