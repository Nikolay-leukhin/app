import 'dart:convert';
import 'dart:developer';

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
    print(cities);
    String encodedCity = jsonEncode(newCity.toJson());

    if (cities == null || cities.contains(encodedCity) == false) {
      await db.setStringList(cityListKey, [encodedCity] + (cities ?? []));
      print('city saved, $newCity');
    } else {
      print('city failed, $newCity');
    }
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

  Future<void> deleteCity(City userCity) async {
    final db = await pref;
    final List<City> rawCityList = await getCities();

    List<String> newCityList = rawCityList.where((city) => city != userCity).map((e) => jsonEncode(e.toJson())).toList();

    if (newCityList.length + 1 == rawCityList.length) {
      final resp = db.setStringList(cityListKey, newCityList);
    } else {
      log('something went wrong may be no such city with tha tname');
    }
  }
}
