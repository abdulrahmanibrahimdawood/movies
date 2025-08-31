import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/request_state.dart';
import 'package:movies/movies/domain/entites/movie_details_entity.dart';
import 'package:movies/movies/domain/usecases/get_movies_details_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMoviesDetailsUsecase)
    : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }
  GetMoviesDetailsUsecase getMoviesDetailsUsecase;

  FutureOr<void> _getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getMoviesDetailsUsecase(
      MoviesDetailsParameters(movieId: event.id.toString()),
    );
    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsMessage: l.message,
          movieDetailsState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetailsEntity: r,
          movieDetailsState: RequestState.loaded,
        ),
      ),
    );
  }
}
