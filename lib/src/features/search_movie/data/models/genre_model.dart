import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/decoder/decoder.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/domain/entities/genre_entity.dart';

class GenreModel extends GenreEntity implements Decodable<GenreModel> {
  const GenreModel({super.id, super.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(id: json["id"], name: json["name"]);

  @override
  GenreModel decode(json) {
    return GenreModel.fromJson(json);
  }
}
