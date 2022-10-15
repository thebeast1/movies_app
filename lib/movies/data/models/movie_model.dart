import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.id,
      required super.title,
      required super.imagePath,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate,
      super.genreIds});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        title: json["title"],
        imagePath: json["backdrop_path"],
        overview: json["overview"],
        voteAverage: json["vote_average"].toDouble(),
        releaseDate: json["release_date"],
        genreIds: json["genre_id"] != null
            ? List<int>.from(json["genre_id"].map((e) => e))
            : json["genre_id"],
      );
}
