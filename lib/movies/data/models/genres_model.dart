import 'package:movies/movies/domain/entites/genres_entity.dart';

class GenresModel extends GenresEntity {
  const GenresModel({required super.name, required super.id});
  factory GenresModel.fromJson(Map<String, dynamic> json) =>
      GenresModel(name: json['name'], id: json['id']);
}
