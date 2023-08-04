// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/network/network_exception.dart';
import '../../domain/entities/movie_listings/movie_listings.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/remote/remote_data_source.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _dataSource;

  RepositoryImpl(this._dataSource);

  @override
  Future<Either<NetworkExceptions, MovieListings>> searchMovie({required String query, required int page}) async {
    try {
      final result = await _dataSource.searchMovie(query: query, page: page);

      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkExceptions.fromDioError(e));
    }
  }
}
