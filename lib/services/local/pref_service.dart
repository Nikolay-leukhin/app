import 'dart:convert';

import 'package:app/models/city.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String cityListKey = 'cityListKey';

class PrefServise {
  late Future<SharedPreferences> pref;

  PrefServise() {
    pref = openPref();
  }

  Future<SharedPreferences> openPref() async {
    return SharedPreferences.getInstance();
  }

  Future<void> saveCity(City newCity) async {
    final db = await pref;
    final List<String>? cities = db.getStringList(cityListKey);

    String encodedCity = jsonEncode(newCity.toJson());

    await db.setStringList(cityListKey, [encodedCity] + (cities ?? []));
  }

  Future<List<City>> getCities() async {
    final db = await pref;
    final List<String>? rawCityList = db.getStringList(cityListKey);

    if (rawCityList == null) {
      return [];
    }

    final List<City> cityList = rawCityList.map((e) => City.fromJson(jsonDecode(e))).toList();

    return cityList;
  }
}
