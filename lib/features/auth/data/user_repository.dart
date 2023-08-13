import 'package:app/features/auth/data/abstract_user_repository.dart';
import 'package:app/services/local/geolocator_service.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class UserRepository implements UserRepositoryInterface {
  @override
  Future<Position?> getUserCoordinates() async {
    Position? userPosition;

    if (await GeolocatorService.isServiceEnabled() && await GeolocatorService.isPermissionAccessed()) {
      userPosition = await GeolocatorService.getUserPosition();
    }
    return userPosition;
  }
}
