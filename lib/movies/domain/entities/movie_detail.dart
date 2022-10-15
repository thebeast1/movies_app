import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final int id;
  final String overview;
  final String releaseDate;
  final int runTime;
  final String title;
  final List<Genres> genres;
  final String voteAverage;

  const MovieDetail(
      {required this.backdropPath,
      required this.id,
      required this.overview,
      required this.releaseDate,
      required this.runTime,
      required this.title,
      required this.genres,
      required this.voteAverage});

  @override
  List<Object> get props => [
        backdropPath,
        id,
        overview,
        releaseDate,
        runTime,
        title,
        voteAverage,
        genres
      ];
}
