import 'package:equatable/equatable.dart';

class MoviesEntity extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final double releaseDate;

  const MoviesEntity({
    required this.releaseDate,
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
  });

  @override
  dynamic noSuchMethod(Invocation invocation) => [
    id,
    title,
    backdropPath,
    genreIds,
    overview,
    voteAverage,
    releaseDate,
  ];
}
