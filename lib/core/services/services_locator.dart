import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies/movies/data/repos/movies_repo_impl.dart';
import 'package:movies/movies/domain/repos/base_movies_repos.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies/movies/presentation/controllers/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //
    sl.registerFactory<MoviesBloc>(() => MoviesBloc(sl()));

    //usecase
    sl.registerLazySingleton<GetNowPlayingMoviesUsecase>(
      () => GetNowPlayingMoviesUsecase(sl()),
    );

    //repos
    sl.registerLazySingleton<BaseMoviesRepos>(
      () => MoviesRepoImpl(sl<BaseMoviesRemoteDataSource>()),
    );

    // dataSource
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
      () => MoviesRemoteDataSource(),
    );
  }
}
