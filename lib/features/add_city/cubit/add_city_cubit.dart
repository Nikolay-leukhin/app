import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_city_state.dart';

class AddCityCubit extends Cubit<AddCityState> {
  AddCityCubit() : super(AddCityInitial());
}
