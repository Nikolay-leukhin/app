import 'dart:developer';

import 'package:app/features/home/data/abstract_home_repository.dart';
import 'package:app/models/current_weather.dart';
import 'package:app/services/api/api_services.dart';
import 'package:app/utils/variables.dart';

class HomeRepository implements AbstractHomeRepository {
  final ApiServices api;
  late CurrentWeather currentWeather;

  HomeRepository({required this.api});

  @override
  Future<WeatherData> getCurrentWeatherForecast(double lat, double lon) async {
    WeatherData weather = await api.weather.getCurrentWeather(lat, lon);
    //
    if (weather.item2 != null) {
      log('INITTED');
      this.currentWeather = weather.item2!;
    }
    return weather;
  }

  @override
  Future getHourlyWeatherForecast() {
    // TODO: implement getHourlyWeatherForecast
    throw UnimplementedError();
  }

  @override
  Future getWeeklyWeatherForecast() {
    // TODO: implement getWeeklyWeatherForecast
    throw UnimplementedError();
  }
}
