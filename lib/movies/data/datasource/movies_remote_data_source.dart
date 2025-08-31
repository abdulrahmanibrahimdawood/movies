import 'package:dio/dio.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/network/api_constance.dart';
import 'package:movies/core/network/error_message_model.dart';
import 'package:movies/movies/data/models/movies_details_model.dart';
import 'package:movies/movies/data/models/movies_model.dart';
import 'package:movies/movies/domain/usecases/get_movies_details_usecase.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
  Future<MoviesDetailsModel> getMoviesDetails(
    MoviesDetailsParameters parameters,
  );
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map((e) => MoviesModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map((e) => MoviesModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map((e) => MoviesModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MoviesDetailsModel> getMoviesDetails(
    MoviesDetailsParameters parameters,
  ) async {
    final response = await Dio().get(
      ApiConstance.movieDetailsPath(parameters.movieId),
    );
    if (response.statusCode == 200) {
      return MoviesDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
