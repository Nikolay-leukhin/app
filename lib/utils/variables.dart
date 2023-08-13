import 'package:app/models/current_weather.dart';
import 'package:tuple/tuple.dart';

import '../services/errors.dart';

typedef WeatherData = Tuple2<Failure?, CurrentWeather?>;
