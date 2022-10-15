

import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlaying();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();
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
}
