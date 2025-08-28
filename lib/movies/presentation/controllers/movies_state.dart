import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/request_state.dart';
import 'package:movies/movies/domain/entites/movies_entity.dart';

class MoviesState extends Equatable {
  final List<MoviesEntity> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
  });
  @override
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingState,
    nowPlayingMessage,
  ];
}
