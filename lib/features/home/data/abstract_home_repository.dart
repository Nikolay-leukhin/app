class AbstractHomeRepository{
  Future<dynamic> getHourlyWeatherForecast() async {}

  Future<dynamic> getWeeklyWeatherForecast() async {}

  Future<dynamic> getCurrentWeatherForecast(double lat, double lon) async {}
} 