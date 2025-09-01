import 'package:movies/movies/domain/entites/recommendation.dart';

class RecommendationModel extends RecommendationEntity {
  const RecommendationModel({required super.id, super.backdropPath});
  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        id: json['id'],
        backdropPath:
            json['backdrop_path'] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg',
      );
}
