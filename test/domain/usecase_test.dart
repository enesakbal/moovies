import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moovies/src/core/constants/url_constants.dart';
import 'package:moovies/src/core/network/network_exception.dart';
import 'package:moovies/src/domain/usecases/usecase.dart';

import '../_utils/mock/test_mocks.mocks.dart';

void main() {
  late MockMovieListings mockMovieListings;
  late MockRepository mockRepository;
  late Usecases usecases;

  setUp(() {
    mockMovieListings = MockMovieListings();
    mockRepository = MockRepository();
    usecases = Usecases(mockRepository);
  });

  test(
    'should get mockMovieListings entity from the repository',
    () async {
      when(mockRepository.searchMovie(page: 0, query: 'test')).thenAnswer((_) async {
        return Right(mockMovieListings);
      });

      final result = await usecases.searchMovie(page: 0, query: 'test');

      expect(result, equals(Right(mockMovieListings)));
    },
  );
  test(
    'should throw NetworkExceptions from the repository',
    () async {
      when(mockRepository.searchMovie(page: 0, query: 'test')).thenAnswer((_) async {
        return Left(
          NetworkExceptions.fromDioError(DioException(requestOptions: RequestOptions(path: UrlContants.searchMovie))),
        );
      });

      final result = await usecases.searchMovie(page: 0, query: 'test');

      expect(
        result,
        equals(Left(NetworkExceptions.fromDioError(DioException(
          requestOptions: RequestOptions(path: UrlContants.searchMovie),
        )))),
      );
    },
  );
}
