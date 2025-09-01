import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/domain/entites/movie_details_entity.dart';
import 'package:movies/movies/domain/entites/movies_entity.dart';
import 'package:movies/movies/domain/entites/recommendation.dart';
import 'package:movies/movies/domain/usecases/get_movies_details_usecase.dart';
import 'package:movies/movies/domain/usecases/get_recommendation_usecase.dart';

abstract class BaseMoviesRepos {
  Future<Either<Failure, List<MoviesEntity>>> getNowPlayingMovies();
  Future<Either<Failure, List<MoviesEntity>>> getPopularMovies();
  Future<Either<Failure, List<MoviesEntity>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetailsEntity>> getMoviesDetails(
    MoviesDetailsParameters parameters,
  );
  Future<Either<Failure, List<RecommendationEntity>>> getMovieRecommendation(
    RecommendationParameters parameters,
  );
}
