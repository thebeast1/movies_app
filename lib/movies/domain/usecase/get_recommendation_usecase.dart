import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParams> {
  final BaseMoviesRepository moviesRepository;

  GetRecommendationUseCase(this.moviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParams recommendationParams) {
    return moviesRepository.getRecommendation(recommendationParams);
  }
}

class RecommendationParams extends Equatable {
  final int movieId;

  const RecommendationParams({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
