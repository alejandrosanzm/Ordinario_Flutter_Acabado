class Prediction {
  final String applicable_date;
  final double the_temp;
  final String weather_state_name;

  Prediction({this.applicable_date, this.the_temp, this.weather_state_name});

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      applicable_date: json['applicable_date'],
      the_temp: json['the_temp'],
      weather_state_name: json['weather_state_name'],
    );
  }
}
