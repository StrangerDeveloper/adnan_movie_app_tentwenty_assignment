import 'package:equatable/equatable.dart';

class MovieImageEntity extends Equatable {
  final double? aspectRatio;
  final int? height;
  final String? iso6391;
  final String? filePath;
  final double? voteAverage;
  final int? voteCount;
  final int? width;

  const MovieImageEntity({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  @override
  List<Object?> get props => [aspectRatio, height, iso6391, filePath, voteAverage, voteCount, width];
}
