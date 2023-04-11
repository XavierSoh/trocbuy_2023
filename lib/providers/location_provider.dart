import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationProvider with ChangeNotifier, DiagnosticableTreeMixin {
  double? lat, lng;
  List<Marker> markers = [];
  void changeLatLng(LatLng position) {
    lat = lat ?? position.latitude;
    lng = lng ?? position.longitude;
    markers.clear();
    markers.add(Marker(
        markerId: MarkerId('Votre emplacemet'), position: LatLng(lat!, lng!)));
    notifyListeners();
  }

  void updateMarker(LatLng newPosition) {
    markers.clear();
    markers.add(
        Marker(markerId: MarkerId('Votre emplacemet'), position: newPosition));
    lat = newPosition.latitude;
    lng = newPosition.longitude;
    notifyListeners();
  }
}
