import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.imagePath,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate,
      required super.genreIds});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json["id"],
      title: json["title"],
      imagePath: json["backdrop_path"],
      overview: json["overview"],
      ///TODO:: Check This
      voteAverage: json["vote_average"],
      releaseDate: json["release_date"],
      genreIds: List<int>.from(json["genre_id"].map((e) => e)));
}
