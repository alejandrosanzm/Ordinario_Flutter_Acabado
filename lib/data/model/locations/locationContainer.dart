import 'package:examen_extraordinario/data/model/locations/location.dart';

class LocationContainer {
  final List<Location> locations;

  LocationContainer({this.locations});

  factory LocationContainer.fromJson(List<dynamic> json) {
    List<Location> locations = json.map((i)=>Location.fromJson(i)).toList();

    return LocationContainer(
      locations: locations,
    );
  }
}
