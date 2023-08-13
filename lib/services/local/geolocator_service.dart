import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  static Future<bool> isServiceEnabled() async {
    // check a gps modul is turned on
    bool isEnabled = await Geolocator.isLocationServiceEnabled();
    return isEnabled;
  }

  static Future<bool> isPermissionAccessed() async {
    // checking perm to get gps cords
    LocationPermission perm = await Geolocator.checkPermission();
    if (perm == LocationPermission.denied) {
      perm = await Geolocator.requestPermission();
    }
    return (perm != LocationPermission.denied) && (perm != LocationPermission.deniedForever);
  }

  static Future<Position> getUserPosition() async {
    // 
    Position userPosition = await Geolocator.getCurrentPosition();
    return userPosition;
  }
}
