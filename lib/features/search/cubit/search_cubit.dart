import 'dart:developer';

import 'package:app/features/home/data/home_repository.dart';
import 'package:app/features/search/data/search_repository.dart';
import 'package:app/models/city.dart';
import 'package:app/models/current_weather.dart';
import 'package:app/services/local/pref_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final PrefServise pref;
  final SearchRepository searchRepository;

  SearchCubit({required this.pref, required this.searchRepository}) : super(SearchInitial());

  void loadUserWeatherSubscriptions() async {
    emit(SearchWaitingState());

    final List<City> cityList = await pref.getCities();
    try {
      final List<CurrentWeather> weatherList = await searchRepository.getSubCitiesForecast(cityList);
      emit(SearchLoadedSuccessState());
    } catch (ex) {
      log(ex.toString());
      emit(SearchLoadedFailureState());
    }
  }

  void deleteCity(City deletingCity) {
    try {
      searchRepository.weatherList = searchRepository.weatherList.where((weather) => weather.cityData != deletingCity).toList();
      pref.deleteCity(deletingCity);
      emit(SearchLoadedSuccessState());
    } catch (ex) {
      log(ex.toString());
      emit(SearchLoadedFailureState());
    }
  }
}
