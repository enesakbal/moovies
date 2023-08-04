import 'package:mockito/annotations.dart';
import 'package:moovies/src/data/datasources/remote/remote_data_source.dart';
import 'package:moovies/src/data/models/movie/movie_model.dart';
import 'package:moovies/src/data/models/movie_listings_model/movie_listings_model.dart';
import 'package:moovies/src/domain/entities/movie/movie.dart';
import 'package:moovies/src/domain/entities/movie_listings/movie_listings.dart';
import 'package:moovies/src/domain/repositories/repository.dart';
import 'package:moovies/src/domain/usecases/usecase.dart';

@GenerateMocks([
  Repository,
  RemoteDataSource,
  Usecases,
  MovieListingsModel,
  MovieListings,
  MovieModel,
  Movie,
])
void main() {}
