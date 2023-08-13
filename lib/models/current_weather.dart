class CurrentWeather {
  final String main;

  final String description;

  final double temp;

  final double feelsLikeTemp;

  final double seaLevel;

  final double pressure;

  final String placeName;

  CurrentWeather({required this.placeName, required this.main, required this.description, required this.temp, required this.feelsLikeTemp, required this.seaLevel, required this.pressure});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      main: json['weather'][0]['main'], 
      description: json['weather'][0]['description'], 
      temp: json['main']['temp'], 
      feelsLikeTemp: json['main']['feels_like'], 
      seaLevel: json['main']['sea_level'], 
      pressure: json["main"]['pressure'],
      placeName: json['name']
      );
  }

  @override
  String toString() {
    return "CurWEather($main, $temp, $description, $pressure)";
  }
}
