import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/data/models/movie_image_model.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/decoder/decoder.dart';

/// TMDB API response structure for images endpoint
class MovieImagesResponseModel implements Decodable<MovieImagesResponseModel> {
  final int? id;
  final List<MovieImageModel> backdrops;
  final List<MovieImageModel> posters;
  final List<MovieImageModel> logos;

  MovieImagesResponseModel({
    this.id,
    List<MovieImageModel>? backdrops,
    List<MovieImageModel>? posters,
    List<MovieImageModel>? logos,
  }) : backdrops = backdrops ?? [],
       posters = posters ?? [],
       logos = logos ?? [];

  factory MovieImagesResponseModel.fromJson(Map<String, dynamic> json) {
    return MovieImagesResponseModel(
      id: json['id'] as int?,
      backdrops:
          (json['backdrops'] as List<dynamic>?)
              ?.map(
                (item) =>
                    MovieImageModel.fromJson(item as Map<String, dynamic>),
              )
              .toList() ??
          [],
      posters:
          (json['posters'] as List<dynamic>?)
              ?.map(
                (item) =>
                    MovieImageModel.fromJson(item as Map<String, dynamic>),
              )
              .toList() ??
          [],
      logos:
          (json['logos'] as List<dynamic>?)
              ?.map(
                (item) =>
                    MovieImageModel.fromJson(item as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );
  }

  @override
  MovieImagesResponseModel decode(dynamic json) {
    return MovieImagesResponseModel.fromJson(json as Map<String, dynamic>);
  }
}
