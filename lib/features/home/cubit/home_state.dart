part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeAccessGPSDenied extends HomeState {}

final class HomeNoInternetConnection extends HomeState{}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedSuccessState extends HomeState {}

final class HomeLoadedFailureState extends HomeState {}
