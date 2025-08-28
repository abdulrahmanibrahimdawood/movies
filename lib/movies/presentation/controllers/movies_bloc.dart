import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/request_state.dart';
import 'package:movies/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies/movies/data/repos/movies_repo_impl.dart';
import 'package:movies/movies/domain/repos/base_movies_repos.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies/movies/presentation/controllers/movies_event.dart';
import 'package:movies/movies/presentation/controllers/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      BaseMoviesRemoteDataSource baseMoviesRemoteDataSource =
          MoviesRemoteDataSource();
      BaseMoviesRepos baseMoviesRepos = MoviesRepoImpl(
        baseMoviesRemoteDataSource,
      );
      final result = await GetNowPlayingMoviesUsecase(
        baseMoviesRepos,
      ).execute();
      emit(const MoviesState(nowPlayingState: RequestState.loaded));
      result.fold(
        (l) => MoviesState(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        ),
        (r) => emit(
          MoviesState(
            nowPlayingState: RequestState.loaded,
            nowPlayingMovies: r,
          ),
        ),
      );

      print(result);
    });
  }
}
