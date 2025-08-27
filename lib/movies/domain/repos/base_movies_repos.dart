import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/domain/entites/movies_entity.dart';

abstract class BaseMoviesRepos {
  Future<Either<Failure, List<MoviesEntity>>> getNowPlayingMovies();
  Future<Either<Failure, List<MoviesEntity>>> getPopularMovies();
  Future<Either<Failure, List<MoviesEntity>>> getTopRatedMovies();
}
