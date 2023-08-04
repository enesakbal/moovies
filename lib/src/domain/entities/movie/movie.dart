import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String? posterPath;
  final bool? adult;
  final String? overview;
  final DateTime? releaseDate;
  final int? id;
  final String? originalTitle;
  final String? originalLanguage;
  final String? title;
  final String? backdropPath;
  final double? popularity;
  final int? voteCount;
  final double? voteAverage;

  const Movie({
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.id,
    this.originalTitle,
    this.originalLanguage,
    this.title,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.voteAverage,
  });

  @override
  List<Object?> get props => [
        posterPath,
        adult,
        overview,
        releaseDate,
        id,
        originalTitle,
        originalLanguage,
        title,
        backdropPath,
        popularity,
        voteCount,
        voteAverage,
      ];
}
