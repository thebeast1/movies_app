import 'package:movies_app/movies/data/models/genres_model.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel(
      {required super.backdropPath,
      required super.id,
      required super.overview,
      required super.releaseDate,
      required super.runTime,
      required super.title,
      required super.genres,
      required super.voteAverage});

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
          backdropPath: json["backdrop_path"],
          id: json["id"],
          overview: json["overview"],
          releaseDate: json["release_date"],
          runTime: json["runTime"],
          title: json["title"],
          genres: json["genres"] != null
              ? List<Genres>.from(
                  json["genres"].map((e) => GenresModel.fromJson(e)))
              : [],
          voteAverage: json["vote_average"]);
}
