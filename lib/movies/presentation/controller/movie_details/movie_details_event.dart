part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent {}

class GetMoviesDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  GetMoviesDetailsEvent({required this.movieId});
}

class GetRecommendationEvent extends MovieDetailsEvent {
  final int movieId;

  GetRecommendationEvent(this.movieId);
}
