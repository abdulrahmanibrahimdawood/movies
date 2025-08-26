import 'package:movies/movies/domain/entites/movies_entity.dart';

abstract class BaseMoviesRepos {
  Future<List<MoviesEntity>> getNowPlayingMovies();
  Future<List<MoviesEntity>> getPopularMovies();
  Future<List<MoviesEntity>> getTopRatedMovies();
}
