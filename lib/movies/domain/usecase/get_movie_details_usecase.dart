import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/base_use_case.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetail, MovieDetailsParams> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailsParams movieDetailsParams) async {
    return await baseMoviesRepository.getMovieDetails(movieDetailsParams);
  }
}

class MovieDetailsParams extends Equatable {
  final int movieId;

  const MovieDetailsParams({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
