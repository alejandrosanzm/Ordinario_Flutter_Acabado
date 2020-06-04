import 'package:examen_extraordinario/data/model/predictionsDetail/prediction.dart';

class PredictionContainer {
  final List<Prediction> consolidated_weather;

  PredictionContainer({this.consolidated_weather});

  factory PredictionContainer.fromJson(Map<String, dynamic> json) {
    var list = json['consolidated_weather'] as List;
    List<Prediction> finalList =
        list.map((i) => Prediction.fromJson(i)).toList();

    return PredictionContainer(
      consolidated_weather: finalList,
    );
  }
}
