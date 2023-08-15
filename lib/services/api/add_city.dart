import 'dart:io';

import 'package:app/config.dart';
import 'package:app/models/city.dart';
import 'package:app/services/errors.dart';
import 'package:app/utils/variables.dart';
import 'package:dio/dio.dart';
import 'package:tuple/tuple.dart';

class AddCityAPI {
  final Dio dio_;

  AddCityAPI({required this.dio_});

  Future<EitherData<List<City>>> getCitiesRequest(String name) async {
    final String URL = "https://api.geoapify.com/v1/geocode/search?city=${name}&format=json&apiKey=${API_KEY_CITIES}";
    //
    try {
      final response = await dio_.get(URL);
      if (response.statusCode == 200) {
        List<City> cityList = [];
        for (var json in response.data['results']) {
          cityList.add(City.fromJson(json));
        }
        return Tuple2(null, cityList);
      }
      throw Failure(msg: 'wtf idk in the ADD city api');
    } on ServerSocket {
      return Tuple2(Failure(msg: FailureMessage.NO_INTERNET_CONNECTION), null);
    } on HttpException {
      return Tuple2(Failure(msg: FailureMessage.BAD_REQUEST), null);
    } on DioException catch (ex) {
      throw Failure(msg: ex.toString());
    } catch (ex) {
      throw Failure(msg: ex.toString());
    }
  }
}


// https://api.geoapify.com/v1/geocode/search?city=Tokyo&format=json&apiKey=YOUR_API_KEY
