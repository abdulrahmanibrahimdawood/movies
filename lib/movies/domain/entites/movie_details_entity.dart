import 'package:equatable/equatable.dart';
import 'package:movies/movies/domain/entites/genres_entity.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final List<GenresEntity> genres;
  final int id;
  final String overview;
  final int runtime;
  final String releaseDate;
  final String title;
  final double voteAverage;
  const MovieDetails({
    required this.genres,
    required this.backdropPath,
    required this.id,
    required this.overview,
    required this.runtime,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
    backdropPath,
    id,
    overview,
    runtime,
    releaseDate,
    title,
    voteAverage,
    genres,
  ];
}
