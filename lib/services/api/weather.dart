part of "api_services.dart";

class Weather {
  final Dio dio_;

  Weather({required this.dio_});

  Future<WeatherData> getCurrentWeather(double lat, double lon) async {
    final URl = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$API_KEY&units=metric";
    try {
      final response = await dio_.get(URl);
      if (response.statusCode == 200) {
        print(response.data.toString());
        return Tuple2(null, CurrentWeather.fromJson(response.data));
      }
      throw Failure(msg: FailureMessage.UNHANDLED_ERROR);
    } on ServerSocket {
      return Tuple2(Failure(msg: FailureMessage.NO_INTERNET_CONNECTION), null);
    } on HttpException {
      return Tuple2(Failure(msg: FailureMessage.BAD_REQUEST), null);
    } catch (ex) {
      log(ex.toString());
      throw Failure(msg: ex.toString());
    }
  }
}
