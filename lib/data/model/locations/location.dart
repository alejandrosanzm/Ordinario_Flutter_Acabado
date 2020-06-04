class Location {
  final int woeid;
  final String title;

  Location({this.woeid, this.title});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      woeid: json['woeid'],
      title: json['title'],
    );
  }
}
