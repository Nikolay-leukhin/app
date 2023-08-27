import 'package:app/models/current_weather.dart';
import 'package:tuple/tuple.dart';

import '../services/errors.dart';

// TODO я дурак ведь можно было сделат ьчерез дженерики и тогда бы все иделаьно подходило под все виды запросов пожтмоу надо жто переделать но потом
typedef WeatherData = Tuple2<Failure?, CurrentWeather?>;

typedef EitherData<T> = Tuple2<Failure?, T?>;
