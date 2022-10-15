import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/movies/data/models/movie_detail_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/recommendation_model.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlaying();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailModel> getMovieDetails(
      MovieDetailsParams movieDetailsParams);

  Future<List<RecommendationModel>> getRecommendations(
      RecommendationParams recommendationParams);
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlaying() async {
    try {
      final response = await Dio(BaseOptions(
        connectTimeout: 6000,
      )).get(ApiConstants.nowPlayingPath);
      if (response.statusCode == 200) {
        return List<MovieModel>.from((response.data["results"] as List)
            .map((e) => MovieModel.fromJson(e)));
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    } catch (e) {
      throw LocalDataBaseException(errorMessage: e.toString());
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await Dio(BaseOptions(
        connectTimeout: 6000,
      )).get(ApiConstants.popularMoviesPath);
      if (response.statusCode == 200) {
        return List<MovieModel>.from((response.data["results"] as List)
            .map((e) => MovieModel.fromJson(e)));
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    } catch (e) {
      throw LocalDataBaseException(errorMessage: e.toString());
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      final response = await Dio(BaseOptions(
        connectTimeout: 6000,
      )).get(ApiConstants.topRatedMoviesPath);

      if (response.statusCode == 200) {
        return List<MovieModel>.from((response.data["results"] as List)
            .map((e) => MovieModel.fromJson(e)));
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    } catch (e) {
      throw LocalDataBaseException(errorMessage: e.toString());
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetails(
      MovieDetailsParams movieDetailsParams) async {
    try {
      final response = await Dio(BaseOptions(
        connectTimeout: 6000,
      )).get(ApiConstants.movieDetailsPath(movieDetailsParams.movieId));

      if (response.statusCode == 200) {
        return MovieDetailModel.fromJson(response.data);
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    } catch (e) {
      throw LocalDataBaseException(errorMessage: e.toString());
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendations(
      RecommendationParams recommendationParams) async {
    try {
      final response = await Dio(BaseOptions(
        connectTimeout: 6000,
      )).get(ApiConstants.recommendationPath(recommendationParams.movieId));

      if (response.statusCode == 200) {
        return List<RecommendationModel>.from((response.data["result"] as List)
            .map((e) => RecommendationModel.fromJson(e)));
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    } catch (e) {
      throw LocalDataBaseException(errorMessage: e.toString());
    }
  }
}
