import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/movie/movie.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends Equatable {
  const MovieModel({
    this.adult,
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  final int? id;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @JsonKey(name: 'original_title')
  final String? originalTitle;

  final String? overview;
  final double? popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'release_date')
  final DateTime? releaseDate;

  final String? title;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final int? voteCount;

  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      voteAverage,
      voteCount,
    ];
  }

  Movie toEntity() => Movie(
        adult: adult,
        backdropPath: backdropPath,
        id: id,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
