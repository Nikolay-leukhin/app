import 'package:app/models/city.dart';
import 'package:app/services/local/pref_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_city_state.dart';

class AddCityCubit extends Cubit<AddCityState> {
  final PrefServise pref;

  AddCityCubit({required this.pref}) : super(AddCityInitial());

  Future<void> saveCity(City newCity) async {
    try {
      await pref.saveCity(newCity);
      emit(CitySavedSuccessState());
    } catch (ex) {
      emit(CitySavedFailureState());
    }
  }
}
