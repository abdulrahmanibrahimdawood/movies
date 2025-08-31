import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_use_case.dart';
import 'package:movies/movies/domain/entites/movies_entity.dart';
import 'package:movies/movies/domain/repos/base_movies_repos.dart';

class GetPopulerMoviesUsecase extends BaseUseCase<List<MoviesEntity>> {
  final BaseMoviesRepos baseMoviesRepos;

  GetPopulerMoviesUsecase(this.baseMoviesRepos);

  @override
  Future<Either<Failure, List<MoviesEntity>>> call() async {
    return await baseMoviesRepos.getPopularMovies();
  }
}
