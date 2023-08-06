part of 'search_movie_bloc.dart';

sealed class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<Object> get props => [];
}

class SearchMovieInitial extends SearchMovieState {
  const SearchMovieInitial();
}

class SearchMovieLoading extends SearchMovieState {
  const SearchMovieLoading();
}

class SearchMovieError extends SearchMovieState {
  const SearchMovieError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}

class SearchMovieEmpty extends SearchMovieState {
  const SearchMovieEmpty(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}

class SearchMovieSuccess extends SearchMovieState {
  const SearchMovieSuccess(this.movieList);
  final List<Movie> movieList;

  @override
  List<Object> get props => [movieList];
}
