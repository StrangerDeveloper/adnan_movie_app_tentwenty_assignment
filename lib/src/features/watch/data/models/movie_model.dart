import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/decoder/decoder.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/data/models/genre_model.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity implements Decodable<MovieModel> {
  const MovieModel({
    super.id,
    super.title,
    super.overview,
    super.posterPath,
    super.backdropPath,
    super.releaseDate,
    super.voteAverage,
    super.voteCount,
    super.genres,
    super.genreIds,
    super.originalLanguage,
    super.originalTitle,
    super.adult,
    super.popularity,
    super.video,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    id: json["id"],
    title: json["title"],
    overview: json["overview"],
    posterPath: json["poster_path"],
    backdropPath: json["backdrop_path"],
    releaseDate: json["release_date"],
    voteAverage: json["vote_average"],
    voteCount: json["vote_count"],
    genreIds: json["genre_ids"] != null ? List<int>.from(json["genre_ids"] as List) : null,
    genres: json["genres"] != null
        ? (json["genres"] as List).map((genre) => GenreModel.fromJson(genre as Map<String, dynamic>)).toList()
        : null,
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    adult: json["adult"],
    popularity: json["popularity"],
    video: json["video"],
  );

  @override
  MovieModel decode(json) {
    return MovieModel.fromJson(json);
  }
}
