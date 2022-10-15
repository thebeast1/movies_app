part of 'movie_details_bloc.dart';

class MovieDetailsState {
  final MovieDetail? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;

  final List<Recommendation>? recommendationsList;
  final RequestState recommendationState;
  final String recommendationMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendationsList,
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetail? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendationsList,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) =>
      MovieDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
        recommendationsList: recommendationsList ?? this.recommendationsList,
        recommendationState: recommendationState ?? this.recommendationState,
        recommendationMessage:
            recommendationMessage ?? this.recommendationMessage,
      );
}
