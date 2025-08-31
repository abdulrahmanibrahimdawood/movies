part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final String id;
  const GetMovieDetailsEvent(this.id);
  @override
  List<Object> get props => [id];
}

class GetMovieRecommendationEvent extends MovieDetailsEvent {
  final String id;
  const GetMovieRecommendationEvent(this.id);
  @override
  List<Object?> get props => [id];
}
