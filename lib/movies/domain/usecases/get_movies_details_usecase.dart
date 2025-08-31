import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_use_case.dart';
import 'package:movies/movies/domain/entites/movie_details_entity.dart';
import 'package:movies/movies/domain/repos/base_movies_repos.dart';

class GetMoviesDetailsUsecase
    extends BaseUseCase<MovieDetailsEntity, MoviesDetailsParameters> {
  BaseMoviesRepos baseMoviesRepos;

  GetMoviesDetailsUsecase(this.baseMoviesRepos);

  @override
  Future<Either<Failure, MovieDetailsEntity>> call(
    MoviesDetailsParameters parameters,
  ) async {
    return await baseMoviesRepos.getMoviesDetails();
  }
}

class MoviesDetailsParameters extends Equatable {
  final int movieId;

  const MoviesDetailsParameters({required this.movieId});

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}
