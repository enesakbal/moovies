// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../domain/repositories/repository.dart';
import '../datasources/remote/remote_data_source.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource dataSource;

  RepositoryImpl(this.dataSource);
}
