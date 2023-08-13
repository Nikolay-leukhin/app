import 'dart:developer';

import 'package:app/features/auth/data/user_repository.dart';
import 'package:app/features/home/data/home_repository.dart';
import 'package:app/utils/variables.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  final UserRepository userRepository;

  HomeCubit({required this.homeRepository, required this.userRepository}) : super(HomeInitial());

  void processLoadCurrentWeather() async {
    emit(HomeLoadingState());
    //
    Position? userCoords = await userRepository.getUserCoordinates();
    if (userCoords == null) {
      emit(HomeAccessGPSDenied());
      return;
    }
    //
    final WeatherData weatherData = await homeRepository.getCurrentWeatherForecast(userCoords.latitude, userCoords.longitude);
    if (weatherData.item1 == null) {
      emit(HomeLoadedSuccessState());
    } else {
      log(weatherData.item2.toString());
      emit(HomeLoadedFailureState());
    }
  }
}
