abstract class MoviesEvent {
  MoviesEvent();
}

class GetNowPlayingEvent extends MoviesEvent {}

class GetPopularMoviesEvent extends MoviesEvent {}

class GetTopRatedMoviesEvent extends MoviesEvent {}
