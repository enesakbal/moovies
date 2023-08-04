// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../core/network/dio_client.dart';
import 'remote_data_source.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final DioClient client;

  RemoteDataSourceImpl(this.client);
}
