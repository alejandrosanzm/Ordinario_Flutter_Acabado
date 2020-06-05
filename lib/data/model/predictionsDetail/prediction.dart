class Prediction {
  final String applicable_date;
  final double the_temp;
  final String weather_state_name;
  final String weather_state_abbr;
  final double min_temp;
  final double max_temp;

  Prediction(
      {this.applicable_date,
      this.the_temp,
      this.weather_state_name,
      this.weather_state_abbr,
      this.min_temp,
      this.max_temp});

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      applicable_date: json['applicable_date'],
      the_temp: json['the_temp'],
      weather_state_name: json['weather_state_name'],
      weather_state_abbr: json['weather_state_abbr'],
      min_temp: json['min_temp'],
      max_temp: json['max_temp'],
    );
  }
}
