import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../model/ad.dart';

class AdGoogleMaps extends StatefulWidget {
  const AdGoogleMaps({Key? key, required this.ad}) : super(key: key);

  final Ad ad;

  @override
  _AdGoogleMapsState createState() => _AdGoogleMapsState();
}

class _AdGoogleMapsState extends State<AdGoogleMaps> {
  List<Marker> allMarkers = [];
  @override
  void initState() {
    allMarkers.add(
      Marker(
        markerId: const MarkerId('myposition2'),
        draggable: false,
        visible: true,
        consumeTapEvents: false,
        position: LatLng(widget.ad.lat!, widget.ad.lng!),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 0.0),
      child: Container(
        height: 160,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 90 / 100,
        child: GoogleMap(
          myLocationButtonEnabled: true,
          liteModeEnabled: true,
          zoomControlsEnabled: false,
          markers: Set.from(allMarkers),
          initialCameraPosition: CameraPosition(
              target: LatLng(
                widget.ad.lat!,
                widget.ad.lng!,
              ),
              zoom: 14,
              tilt: 5.0),
        ),
      ),
    );
  }
}
