part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetailsEntity? movieDetailsEntity;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  const MovieDetailsState({
    this.movieDetailsEntity,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetailsEntity? movieDetailsEntity,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
  }) {
    return MovieDetailsState(
      movieDetailsEntity: movieDetailsEntity ?? this.movieDetailsEntity,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
    );
  }

  @override
  List<Object> get props => [
    movieDetailsEntity!,
    movieDetailsState,
    movieDetailsMessage,
  ];
}
