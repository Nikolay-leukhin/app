import 'dart:developer';
import 'dart:io';

import 'package:app/config.dart';
import 'package:app/models/current_weather.dart';
import 'package:app/services/errors.dart';
import 'package:app/utils/variables.dart';
import 'package:dio/dio.dart';
import 'package:tuple/tuple.dart';

part 'weather.dart';

class ApiServices {
  late Weather weather;

  final Dio dio = Dio(BaseOptions(headers: {
    'Content-Type': 'application/x-www-form-urlencoded',
  }));

  ApiServices() {
    weather = Weather(dio_: dio);
  }
}
