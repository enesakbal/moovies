import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/movie_listings/movie_listings.dart';
import '../movie/movie_model.dart';

part 'movie_listings_model.g.dart';

@JsonSerializable()
class MovieListingsModel extends Equatable {
  final int? page;
  final List<MovieModel>? results;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_results')
  final int? totalResults;

  const MovieListingsModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieListingsModel.fromJson(Map<String, dynamic> json) {
    return _$MovieListingsModelFromJson(json);
  }

  MovieListings toEntity() => MovieListings(
        page: page,
        results: results?.map((e) => e.toEntity()).toList(),
        totalPages: totalPages,
        totalResults: totalResults,
      );

  Map<String, dynamic> toJson() => _$MovieListingsModelToJson(this);

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}
