class WeatherModel {
  final String city;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final DateTime date;
  final String image;
  final String condition;
  WeatherModel({
    required this.city,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.date,
    required this.image,
    required this.condition,
  });

  // ignore: strict_top_level_inference
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      city: json['location']['name'],
      temp: json['current']['temp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      date: DateTime.parse(json['current']['last_updated']),
      image: json['current']['condition']['icon'],
      condition: json['current']['condition']['text'],
    );
  }
}
