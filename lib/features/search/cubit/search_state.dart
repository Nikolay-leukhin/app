part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchWaitingState extends SearchState {}

final class SearchLoadedSuccessState extends SearchState {}

final class SearchLoadedFailureState extends SearchState {}
