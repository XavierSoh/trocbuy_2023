import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationFunction {
  bool serviceEnable = false;
  late double lat, lng;

  // This function to enable GPS in device
  Future<void> getPosition() async {
    var permission = await Permission.location.isDenied;

    if (permission) {
      PermissionStatus locationStatus = await Permission.location.request();
      if (locationStatus == PermissionStatus.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }

      Position position = await Geolocator.getCurrentPosition();

      lng = position.longitude;
      lat = position.latitude;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();

    lng = position.longitude;
    lat = position.latitude;
  }

  // This function to get location permission inside app
  static Future<void> getLocationPermission() async {
    /*var permission = await Permission.location.isDenied;

    if (permission) {
      PermissionStatus locationStatus = await Permission.location.request();
      if (locationStatus == PermissionStatus.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }*/
  }
}
