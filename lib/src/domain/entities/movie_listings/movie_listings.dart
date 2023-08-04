import 'package:equatable/equatable.dart';

import '../movie/movie.dart';

class MovieListings extends Equatable {
  final int? page;
  final List<Movie>? results;
  final int? totalPages;
  final int? totalResults;

  const MovieListings({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  @override
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}
