import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/domain/entites/movies_entity.dart';
import 'package:movies/movies/domain/repos/base_movies_repos.dart';

class GetPopulerMoviesUsecase {
  final BaseMoviesRepos baseMoviesRepos;

  GetPopulerMoviesUsecase(this.baseMoviesRepos);

  Future<Either<Failure, List<MoviesEntity>>> execute() async {
    return await baseMoviesRepos.getPopularMovies();
  }
}
