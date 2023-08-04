import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moovies/src/data/datasources/remote/remote_data_source.dart';
import 'package:moovies/src/data/models/movie_listings_model/movie_listings_model.dart';

import '../../_utils/json_reader.dart';
import '../../_utils/mock/test_mocks.mocks.dart';

void main() {
  late RemoteDataSource remoteDataSource;
  late dynamic tMovieListingsData;

  late String tSearch;

  setUp(() {
    dotenv.testLoad(fileInput: File('.env').readAsStringSync());

    remoteDataSource = MockRemoteDataSource();
    tMovieListingsData = readJson('movie_listings_dummy_data.json');
    tSearch = 'the lord';
  });

  test(
    'when reponse code is 200 response model returns MovieListingsModel ',
    () async {
      when(
        remoteDataSource.searchMovie(page: 1, query: tSearch),
      ).thenAnswer((_) async => MovieListingsModel.fromJson(tMovieListingsData as Map<String, dynamic>));

      final response = await remoteDataSource.searchMovie(page: 1, query: tSearch);

      expect(response, isA<MovieListingsModel>());
    },
  );
}
