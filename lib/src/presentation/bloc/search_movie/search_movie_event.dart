// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_movie_bloc.dart';

abstract class SearchMovieEvent extends Equatable {
  const SearchMovieEvent();

  @override
  List<Object> get props => [];
}

class OnSearchMovieEvent extends SearchMovieEvent {
  final String query;
  const OnSearchMovieEvent(this.query);

  @override
  List<Object> get props => [query];
}

class OnFetchAgainSearchMovieEvent extends SearchMovieEvent {
  final String query;
  const OnFetchAgainSearchMovieEvent(this.query);

  @override
  List<Object> get props => [query];
}
