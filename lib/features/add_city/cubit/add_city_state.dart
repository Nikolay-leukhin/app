part of 'add_city_cubit.dart';

@immutable
sealed class AddCityState {}

final class AddCityInitial extends AddCityState {}

final class CityAlreadySavedState extends AddCityState {}

final class CitySavedSuccessState extends AddCityState {}

final class CitySavedFailureState extends AddCityState {}