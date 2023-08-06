import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/transformers.dart';

import '../../../domain/entities/movie/movie.dart';
import '../../../domain/usecases/usecase.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  SearchMovieBloc(this._usecases) : super(const SearchMovieInitial()) {
    on<OnSearchMovieEvent>(
      _onSearchMovieEvent,
      transformer: (events, mapper) => events.debounceTime(const Duration(milliseconds: 400)).asyncExpand(mapper),
    );
    on<OnFetchAgainSearchMovieEvent>(
      _onFetchAgainSearchMovieEvent,
    );
  }

  FutureOr<void> _onSearchMovieEvent(
    OnSearchMovieEvent event,
    Emitter<SearchMovieState> emit,
  ) async {
    isCompleted = false;
    _movieList = [];

    emit(const SearchMovieLoading());
    try {
      final result = await _usecases.searchMovie(query: event.query, page: 1);

      result.fold((failure) {
        emit(SearchMovieError(failure.message));
      }, (data) {
        if (data.results?.isEmpty ?? false) {
          return emit(const SearchMovieEmpty('There is no data'));
        } else {
          _page = data.page ?? 1;
          _movieList = data.results;

          if ((_movieList?.length ?? 0) < 20) {
            isCompleted = true;
          }

          return emit(SearchMovieSuccess(_movieList ?? []));
        }
      });
    } catch (error) {
      log(error.toString());
      return emit(const SearchMovieError('Something went wrong'));
    }
  }

  FutureOr<void> _onFetchAgainSearchMovieEvent(
    OnFetchAgainSearchMovieEvent event,
    Emitter<SearchMovieState> emit,
  ) async {
    if (isCompleted) {
      return;
    }
    try {
      final result = await _usecases.searchMovie(query: event.query, page: _page + 1);

      result.fold((failure) {
        emit(SearchMovieError(failure.message));
      }, (data) {
        if ((data.results?.length ?? 0) < 20) {
          isCompleted = true;
        }

        _page = data.page ?? 1;
        emit(SearchMovieSuccess(List.from(_movieList ?? [])..addAll(data.results ?? [])));

        _movieList?.addAll(data.results ?? []);
        return;
      });
    } catch (error) {
      log(error.toString());
      return emit(const SearchMovieError('Something went wrong'));
    }
  }

  final Usecases _usecases;

  int _page = 1;
  late List<Movie>? _movieList;
  bool isCompleted = false;
}
