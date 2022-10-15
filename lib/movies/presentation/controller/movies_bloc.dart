import 'dart:async';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase();

    result.fold((failure) {
      emit(state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: failure.message));
    }, (movies) {
      emit(state.copyWith(
          nowPlayingState: RequestState.loaded, nowPlayingMovies: movies));
    });
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase();

    result.fold(
      (failure) {
        emit(state.copyWith(
            popularState: RequestState.error, popularMessage: failure.message));
      },
      (moviesList) {
        emit(state.copyWith(
            popularMovies: moviesList, popularState: RequestState.loaded));
      },
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase();

    result.fold(
      (failure) {
        emit(state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: failure.message));
      },
      (moviesList) {
        emit(state.copyWith(
            topRatedMovies: moviesList, topRatedState: RequestState.loaded));
      },
    );
  }
}
