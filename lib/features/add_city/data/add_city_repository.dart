import 'package:app/features/add_city/data/add_city_abstract_repository.dart';
import 'package:app/models/city.dart';
import 'package:app/services/api/api_services.dart';
import 'package:app/utils/variables.dart';

class AddCityRepository implements AddCityAbstractRepository {
  final ApiServices api;

  AddCityRepository(this.api);

  @override
  Future<EitherData<List<City>>> getCities(String name) async {
    final response = await api.addCity.getCitiesRequest(name);
    return response;
  }
}
