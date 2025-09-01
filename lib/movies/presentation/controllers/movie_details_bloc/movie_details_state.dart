part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetailsEntity,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendationEntity = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
  });
  final MovieDetailsEntity? movieDetailsEntity;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<RecommendationEntity> recommendationEntity;
  final RequestState recommendationState;
  final String recommendationMessage;

  MovieDetailsState copyWith({
    MovieDetailsEntity? movieDetailsEntity,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<RecommendationEntity>? recommendationEntity,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetailsEntity: movieDetailsEntity ?? this.movieDetailsEntity,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendationEntity: recommendationEntity ?? this.recommendationEntity,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object> get props => [
    movieDetailsEntity!,
    movieDetailsState,
    movieDetailsMessage,
  ];
}
