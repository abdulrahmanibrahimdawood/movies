import 'package:movies/movies/domain/entites/movies_entity.dart';
import 'package:movies/movies/domain/repos/base_movies_repos.dart';

class GetNowPlayingMoviesUsecase {
  final BaseMoviesRepos baseMoviesRepos;

  GetNowPlayingMoviesUsecase(this.baseMoviesRepos);

  Future<List<MoviesEntity>> execute() async {
    return await baseMoviesRepos.getNowPlayingMovies();
  }
}
