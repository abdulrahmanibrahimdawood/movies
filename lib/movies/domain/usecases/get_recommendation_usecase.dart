import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_use_case.dart';
import 'package:movies/movies/domain/entites/recommendation.dart';
import 'package:movies/movies/domain/repos/base_movies_repos.dart';

class GetRecommendationUsecase
    extends BaseUseCase<List<RecommendationEntity>, RecommendationParameters> {
  BaseMoviesRepos baseMoviesRepos;

  GetRecommendationUsecase(this.baseMoviesRepos);
  @override
  Future<Either<Failure, List<RecommendationEntity>>> call(
    RecommendationParameters parameters,
  ) async {
    return await baseMoviesRepos.getMovieRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final String id;

  const RecommendationParameters({required this.id});
  @override
  List<Object?> get props => [id];
}
