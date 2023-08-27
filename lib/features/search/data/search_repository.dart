import 'package:app/models/city.dart';
import 'package:app/models/current_weather.dart';
import 'package:app/services/api/api_services.dart';
import 'package:app/utils/variables.dart';

class SearchRepository {
  List<CurrentWeather> weatherList = [];

  final ApiServices api;

  SearchRepository(this.api);

  Future<List<CurrentWeather>> getSubCitiesForecast(List<City> cityList) async {
    List<CurrentWeather> cityWeatherList = [];

    for (var city in cityList) {
      final EitherData<CurrentWeather> weather = await api.weather.getCurrentWeather(city.lat, city.lon);
      if (weather.item2 != null) {
        final newWeather = weather.item2!;
        newWeather.cityData = city;
        cityWeatherList.add(newWeather);
      }
    }
    weatherList = cityWeatherList;

    return cityWeatherList;
  }
}
