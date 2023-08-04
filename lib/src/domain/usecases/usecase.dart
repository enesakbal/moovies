// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../core/network/network_exception.dart';
import '../entities/movie_listings/movie_listings.dart';
import '../repositories/repository.dart';

class Usecases {
  final Repository _repository;

  Usecases(this._repository);

  Future<Either<NetworkExceptions, MovieListings>> searchMovie({required String query, required int page}) {
    return _repository.searchMovie(query: query, page: page);
  }
}
