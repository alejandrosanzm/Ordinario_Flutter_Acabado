import 'dart:convert';
import 'package:examen_extraordinario/data/model/predictionsDetail/predictionContainer.dart';
import 'package:http/http.dart' as http;

class PredictionRemote {
  Future<PredictionContainer> fetchPost(String key) async {
    String _url = 'https://www.metaweather.com/api/location/' + key;
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      print("2---> [${json.decode(response.body)}]");
      return PredictionContainer.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
