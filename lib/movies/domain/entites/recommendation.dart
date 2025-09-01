import 'package:equatable/equatable.dart';

class RecommendationEntity extends Equatable {
  final int id;
  final String backdropPath;

  const RecommendationEntity({required this.id, required this.backdropPath});
  @override
  List<Object?> get props => [backdropPath, id];
}
