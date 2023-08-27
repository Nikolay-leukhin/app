part of 'add_city_cubit.dart';

@immutable
sealed class AddCityState {}

final class AddCityInitial extends AddCityState {}

final class CityNotAbleToSaveState extends AddCityState {}

final class CityAbleToSaved extends AddCityState {}

final class CitySavedSuccessState extends AddCityState {}

final class CitySavedFailureState extends AddCityState {}