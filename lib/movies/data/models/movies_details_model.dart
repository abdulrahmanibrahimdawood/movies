import 'package:movies/movies/data/models/genres_model.dart';
import 'package:movies/movies/domain/entites/movie_details_entity.dart';

class MoviesDetailsModel extends MovieDetailsEntity {
  const MoviesDetailsModel({
    required super.genres,
    required super.backdropPath,
    required super.id,
    required super.overview,
    required super.runtime,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
  });

  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) =>
      MoviesDetailsModel(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        overview: json["overview"],
        runtime: json["runtime"],
        releaseDate: json["release_date"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        genres: List<GenresModel>.from(
          json["genres"].map((x) => GenresModel.fromJson(x)),
        ),
      );
}
