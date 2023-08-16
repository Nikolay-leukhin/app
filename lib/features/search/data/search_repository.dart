import 'package:app/models/city.dart';
import 'package:app/models/current_weather.dart';
import 'package:app/services/api/api_services.dart';
import 'package:app/utils/variables.dart';

class SearchRepository {
  final ApiServices api;

  SearchRepository(this.api);

  Future<List<CurrentWeather>> getSubCitiesForecast(List<City> cityList) async {
    List<CurrentWeather> cityWeatherList = [];

    for (var city in cityList) {
      final EitherData<CurrentWeather> weather = await api.weather.getCurrentWeather(city.lat, city.lon);
      if (weather.item2 != null) {
        cityWeatherList.add(weather.item2!);
      }
    }

    return cityWeatherList;
  }
}
