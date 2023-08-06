import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moovies/src/core/constants/url_constants.dart';
import 'package:moovies/src/core/network/network_exception.dart';
import 'package:moovies/src/data/models/movie_listings_model/movie_listings_model.dart';
import 'package:moovies/src/domain/entities/movie_listings/movie_listings.dart';
import 'package:moovies/src/presentation/bloc/search_movie/search_movie_bloc.dart';

import '../../_utils/json_reader.dart';
import '../../_utils/mock/test_mocks.mocks.dart';

void main() async {
  late dynamic tMovieListingsData;
  late MovieListings tMovieListings;

  late MockUsecases mockUsecases;
  late SearchMovieBloc searchMovieBloc;

  setUp(() {
    tMovieListingsData = readJson('movie_listings_dummy_data.json');
    tMovieListings = MovieListingsModel.fromJson(tMovieListingsData as Map<String, dynamic>).toEntity();

    mockUsecases = MockUsecases();
    searchMovieBloc = SearchMovieBloc(mockUsecases);
  });

  test(
    'initial state should be SearchMovieInitial',
    () {
      expect(searchMovieBloc.state, const SearchMovieInitial());
    },
  );

  blocTest<SearchMovieBloc, SearchMovieState>(
    'should emit [SearchMovieLoading, SearchMovieSuccess] when data is fetched successfully',
    build: () {
      when(mockUsecases.searchMovie(page: 1, query: 'test')).thenAnswer(
        (_) async => Right(tMovieListings),
      );
      return searchMovieBloc;
    },
    act: (bloc) => bloc.add(const OnSearchMovieEvent('test')),
    wait: const Duration(milliseconds: 500),
    expect: () => <SearchMovieState>[
      const SearchMovieLoading(),
      SearchMovieSuccess(tMovieListings.results ?? []),
    ],
    verify: (bloc) async {
      verify(mockUsecases.searchMovie(page: 1, query: 'test')).called(1);
    },
  );

  blocTest<SearchMovieBloc, SearchMovieState>(
    'should emit [SearchMovieLoading, SearchMovieError] when data fetching fails',
    build: () {
      when(mockUsecases.searchMovie(page: 1, query: 'test')).thenAnswer(
        (_) async => Left(
          NetworkExceptions.fromDioError(
            DioException(
              requestOptions: RequestOptions(path: UrlContants.searchMovie),
            ),
          ),
        ),
      );
      return searchMovieBloc;
    },
    act: (bloc) => bloc.add(const OnSearchMovieEvent('test')),
    wait: const Duration(milliseconds: 500),
    expect: () => <SearchMovieState>[
      const SearchMovieLoading(),
      const SearchMovieError('Something went wrong'),
    ],
    verify: (bloc) async {
      verify(mockUsecases.searchMovie(page: 1, query: 'test')).called(1);
    },
  );

  blocTest<SearchMovieBloc, SearchMovieState>(
    'should emit [SearchMovieLoading, SearchMovieEmpty] when data is empty',
    build: () {
      const emptyMovieListings = MovieListings(results: [], page: 0);
      when(mockUsecases.searchMovie(page: 1, query: 'test')).thenAnswer(
        (_) async => const Right(emptyMovieListings),
      );
      return searchMovieBloc;
    },
    act: (bloc) => bloc.add(const OnSearchMovieEvent('test')),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      const SearchMovieLoading(),
      const SearchMovieEmpty('There is no data'),
    ],
    verify: (bloc) async {
      verify(mockUsecases.searchMovie(page: 1, query: 'test')).called(1);
    },
  );
}
