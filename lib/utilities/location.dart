import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;
//! метод отвечающий за получение геолокации
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('Something goes wrong: $e');
    }
  }
}
