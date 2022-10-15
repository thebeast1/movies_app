import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_details_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMoviesDetailsEvent>(_getMovieDetailsEvent);
  }

  FutureOr<void> _getMovieDetailsEvent(
      GetMoviesDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(
        MovieDetailsParams(movieId: event.movieId));
    result.fold(
      (failure) => emit(state.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailsMessage: failure.message)),
      (movieDetails) => emit(state.copyWith(
          movieDetailsState: RequestState.loaded, movieDetails: movieDetails)),
    );
  }
}
