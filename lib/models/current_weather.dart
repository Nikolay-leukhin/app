class CurrentWeather {
  final String main;

  final String description;

  final double temp;

  final double feelsLikeTemp;

  final int seaLevel;

  final int pressure;

  final String placeName;

  final int windDegree;

  final double windSpeed;

  final int visibility;

  final DateTime sunrise;

  final DateTime sunset;

  final int humidity;

  CurrentWeather({required this.placeName, required this.main, required this.description, required this.temp, required this.feelsLikeTemp, required this.seaLevel, required this.pressure, required this.windDegree, required this.windSpeed, required this.visibility, required this.sunrise, required this.sunset, required this.humidity});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(main: 
    json['weather'][0]['main'], 
    description: json['weather'][0]['description'], 
    temp: json['main']['temp'], 
    feelsLikeTemp: json['main']['feels_like'], 
    seaLevel: json['main']['sea_level'], 
    pressure: json["main"]['pressure'], 
    placeName: json['name'],
    humidity: json['main']['humidity'],
    sunrise: DateTime.fromMillisecondsSinceEpoch(json['sys']['sunrise'] * 1000, isUtc: true),
    sunset: DateTime.fromMillisecondsSinceEpoch(json['sys']['sunset'] * 1000, isUtc: true),
    visibility: json['visibility'],
    windDegree: json['wind']['deg'],
    windSpeed: json['wind']['speed']
    );
  }

  @override
  String toString() {
    return "CurWEather($main, $temp, $description, $pressure)";
  }
}
