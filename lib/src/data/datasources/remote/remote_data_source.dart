import '../../models/movie_listings_model/movie_listings_model.dart';

abstract class RemoteDataSource {
  Future<MovieListingsModel> searchMovie({required String query, required int page});
}
