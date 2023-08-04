import 'package:dartz/dartz.dart';

import '../../core/network/network_exception.dart';
import '../entities/movie_listings/movie_listings.dart';

abstract class Repository {
  Future<Either<NetworkExceptions, MovieListings>> searchMovie({required String query, required int page});
}
