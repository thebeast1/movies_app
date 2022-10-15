import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String imagePath;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  List<int>? genreIds;

  Movie(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.overview,
      required this.voteAverage,
      required this.releaseDate,
      this.genreIds});

  @override
  List<Object> get props => [
        id,
        title,
        imagePath,
        overview,
        voteAverage,
        releaseDate,
      ];
}
