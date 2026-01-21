import 'package:equatable/equatable.dart';

class MovieVideoEntity extends Equatable {
  final String? id;
  final String? key;
  final String? name;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final String? publishedAt;
  final String? iso6391;
  final String? iso31661;

  const MovieVideoEntity({
    this.id,
    this.key,
    this.name,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.iso6391,
    this.iso31661,
  });

  @override
  List<Object?> get props => [id, key, name, site, size, type, official, publishedAt, iso6391, iso31661];
}
