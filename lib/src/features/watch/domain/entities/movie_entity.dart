import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/domain/entities/genre_entity.dart';
import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int? id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final String? releaseDate;
  final double? voteAverage;
  final int? voteCount;
  final List<int>? genreIds;
  final List<GenreEntity>? genres;
  final String? originalLanguage;
  final String? originalTitle;
  final bool? adult;
  final bool? video;
  final double? popularity;

  const MovieEntity({
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
    this.genreIds,
    this.genres,
    this.originalLanguage,
    this.originalTitle,
    this.adult,
    this.video,
    this.popularity,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    overview,
    posterPath,
    backdropPath,
    releaseDate,
    voteAverage,
    voteCount,
    genreIds,
    originalLanguage,
    originalTitle,
    adult,
    video,
    popularity,
  ];

  @override
  bool get stringify => true;
}
