import 'package:get_it/get_it.dart';
import 'package:movies_app/core/base_use_case.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movie_details/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

final serviceLocator = GetIt.instance;

class ServiceLocator {
  void init() {
    /// Movie Bloc
    serviceLocator.registerFactory(() => MoviesBloc(
          serviceLocator(),
          serviceLocator(),
          serviceLocator(),
        ));

    serviceLocator.registerFactory<MovieDetailsBloc>(
        () => MovieDetailsBloc(serviceLocator(), serviceLocator()));

    /// Use Cases
    serviceLocator.registerLazySingleton(
        () => GetNowPlayingMoviesUseCase(serviceLocator()));

    serviceLocator
        .registerLazySingleton(() => GetPopularMoviesUseCase(serviceLocator()));

    serviceLocator.registerLazySingleton(
        () => GetTopRatedMoviesUseCase(serviceLocator()));

    serviceLocator.registerLazySingleton<GetMovieDetailsUseCase>(
        () => GetMovieDetailsUseCase(serviceLocator()));

    serviceLocator.registerLazySingleton<GetRecommendationUseCase>(
        () => GetRecommendationUseCase(serviceLocator()));

    /// Repository
    serviceLocator.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(serviceLocator()));

    /// Data Source
    serviceLocator.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    serviceLocator
        .registerLazySingleton<NoParameters>(() => const NoParameters());
  }
}
