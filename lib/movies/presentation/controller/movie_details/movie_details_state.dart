part of 'movie_details_bloc.dart';

class MovieDetailsState {
  final MovieDetail? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;

  const MovieDetailsState(
      {this.movieDetails,
      this.movieDetailsState = RequestState.loading,
      this.movieDetailsMessage = ''});

  MovieDetailsState copyWith(
          {MovieDetail? movieDetails,
          RequestState? movieDetailsState,
          String? movieDetailsMessage}) =>
      MovieDetailsState(
          movieDetails: movieDetails ?? this.movieDetails,
          movieDetailsState: movieDetailsState ?? this.movieDetailsState,
          movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage);
}
