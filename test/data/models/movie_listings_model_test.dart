import 'package:flutter_test/flutter_test.dart';
import 'package:moovies/src/data/models/movie/movie_model.dart';
import 'package:moovies/src/data/models/movie_listings_model/movie_listings_model.dart';
import 'package:moovies/src/domain/entities/movie/movie.dart';
import 'package:moovies/src/domain/entities/movie_listings/movie_listings.dart';

void main() {
  late final MovieListingsModel tMovieListingsModel;
  late final MovieListings tMovieListings;

  late final MovieModel tMovieModel;
  late final Movie tMovie;

  setUp(() {
    tMovieModel = MovieModel(
      adult: false,
      id: 512450,
      originalLanguage: 'en',
      originalTitle: 'Lord',
      overview:
          'Although he hates dogs, Toni is engaged in finding lost animals and then sentimentally blackmails the masters in order to obtain beautiful large amounts of money. Because of an old and ugly Pekinese that Toni cannot succeed of getting rid of, feelings of affection awake in him that surprise even Toni.',
      popularity: 0.608,
      releaseDate: DateTime(2011, 9, 29),
      title: 'Lord',
      voteAverage: 5.2,
      voteCount: 14,
    );

    tMovie = Movie(
      adult: false,
      id: 512450,
      originalLanguage: 'en',
      originalTitle: 'Lord',
      overview:
          'Although he hates dogs, Toni is engaged in finding lost animals and then sentimentally blackmails the masters in order to obtain beautiful large amounts of money. Because of an old and ugly Pekinese that Toni cannot succeed of getting rid of, feelings of affection awake in him that surprise even Toni.',
      popularity: 0.608,
      releaseDate: DateTime(2011, 9, 29),
      title: 'Lord',
      voteAverage: 5.2,
      voteCount: 14,
    );

    tMovieListingsModel = MovieListingsModel(
      page: 1,
      totalPages: 4,
      totalResults: 100,
      results: [tMovieModel],
    );

    tMovieListings = MovieListings(
      page: 1,
      totalPages: 4,
      totalResults: 100,
      results: [tMovie],
    );
  });
  group('to Entity', () {
    test(
      'should be a subclass of MovieListingsModel',
      () async {
        final result = tMovieListingsModel.toEntity();
        expect(result, equals(tMovieListings));
      },
    );
  });
}
