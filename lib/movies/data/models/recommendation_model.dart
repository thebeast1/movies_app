import 'package:movies_app/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  RecommendationModel({required super.id, required super.backdropPath});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
      );
}
