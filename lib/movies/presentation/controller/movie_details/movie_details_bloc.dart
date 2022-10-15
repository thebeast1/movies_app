import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMoviesDetailsEvent>(_getMovieDetailsEvent);
    on<GetRecommendationEvent>(_getRecommendationEvent);
  }

  FutureOr<void> _getMovieDetailsEvent(
      GetMoviesDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(
        MovieDetailsParams(movieId: event.movieId));

    result.fold(
      (failure) {
        log("_getMovieDetailsEvent: ${failure.message}");
        emit(state.copyWith(
            movieDetailsState: RequestState.error,
            movieDetailsMessage: failure.message));
      },
      (movieDetails) => emit(state.copyWith(
          movieDetailsState: RequestState.loaded, movieDetails: movieDetails)),
    );
  }

  FutureOr<void> _getRecommendationEvent(
      GetRecommendationEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUseCase(
        RecommendationParams(movieId: event.movieId));

    result.fold(
      (failure) {
        log("_getRecommendationEvent: ${failure.message}");
        emit(state.copyWith(
            recommendationMessage: failure.message,
            recommendationState: RequestState.error));
      },
      (recommendationList) => emit(state.copyWith(
          recommendationState: RequestState.loaded,
          recommendationsList: recommendationList)),
    );
  }
}
