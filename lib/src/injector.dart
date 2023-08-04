import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/network/dio_client.dart';
import 'data/datasources/remote/remote_data_source.dart';
import 'data/datasources/remote/remote_data_source_impl.dart';
import 'data/repositories/repository_impl.dart';
import 'domain/repositories/repository.dart';
import 'domain/usecases/usecase.dart';


/// Register all the dependencies that are needed for the app to run.
final injector = GetIt.instance;

/// It initializes the dependency injection.
Future<void> init() async {
  injector

        //* Network
        ..registerLazySingleton<DioClient>(() => DioClient(Dio()))

        //* Datasources
        ..registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(injector()))

        //* Repository
        ..registerLazySingleton<Repository>(() => RepositoryImpl(injector()))

        //* Usecase
        ..registerLazySingleton(() => Usecases(injector()))

        //* BLoC

      ;
}
