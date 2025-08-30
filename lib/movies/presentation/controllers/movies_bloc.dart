import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/request_state.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_populer_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies/movies/presentation/controllers/movies_event.dart';
import 'package:movies/movies/presentation/controllers/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  GetPopulerMoviesUsecase getPopulerMoviesUsecase;
  GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  MoviesBloc(
    this.getNowPlayingMoviesUsecase,
    this.getPopulerMoviesUsecase,
    this.getTopRatedMoviesUsecase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUsecase.execute();
      result.fold(
        (l) => state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        ),
        (r) => emit(
          state.copyWith(
            nowPlayingState: RequestState.loaded,
            nowPlayingMovies: r,
          ),
        ),
      );
    });
    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopulerMoviesUsecase.execute();

      emit(const MoviesState(popularState: RequestState.loaded));
      result.fold(
        (l) => state.copyWith(
          popularState: RequestState.error,
          popularMessage: l.message,
        ),
        (r) =>
            state.copyWith(popularState: RequestState.loaded, popularMovies: r),
      );
    });
  }
}
