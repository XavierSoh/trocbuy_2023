import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';


class AroundMeFunctions {
  bool isLocationActive = false;

  // ///Get whether location is active or not
  // Future<bool> setLocationState() async {
  //   isLocationActive = await Location().serviceEnabled();
  //   return isLocationActive;
  // }

  /// Determine the current position of the device.
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.

  static Future<Position> determinePosition() async {

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

      return position;

    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

/*  static Future<LocationData?> getDevicePosition() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    location.changeSettings(accuracy: LocationAccuracy.low);
    _locationData = await location.getLocation();
    return _locationData;
  }*/

  /*static Future<int> getAroundMeQuantity() async {
    String url = Utils.baseUrl + "/get_table.php";
    int quantity = 0;
    try {
      await http
          .post(
        Uri.parse(url),
        body: jsonEncode(
          {
            "filter": FilterNames.countAroundMeAds.name,
            "body": {
              "location": AroundMeAds.position!.toJson(),
            },
          },
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            quantity = List.from(
              jsonDecode(value.body),
            ).map((e) => e["number"] as int).first;
            quantity = quantity;
          }
        },
      );
    } catch (exception) {
      if (kDebugMode) {}
    }
    return quantity;
  }*/
}
