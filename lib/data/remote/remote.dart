import 'dart:convert';
import 'package:examen_extraordinario/data/model/locations/locationContainer.dart';
import 'package:http/http.dart' as http;

class Remote {
  Future<LocationContainer> fetchPost(String key) async {
    String _url =
        'https://www.metaweather.com/api/location/search/?query=' + key;
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      print("---> [${json.decode(response.body)}]");
      return LocationContainer.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
