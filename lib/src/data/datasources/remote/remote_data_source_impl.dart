// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../core/constants/url_constants.dart';
import '../../../core/network/dio_client.dart';
import '../../models/movie_listings_model/movie_listings_model.dart';
import 'remote_data_source.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final DioClient _client;

  RemoteDataSourceImpl(this._client);

  @override
  Future<MovieListingsModel> searchMovie({required String query, required int page}) async {
    try {
      final response = await _client.get(UrlContants.searchMovie, queryParameters: {'query': query, 'page': page});

      final movieList = MovieListingsModel.fromJson(response.data as Map<String, dynamic>);

      return movieList;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
