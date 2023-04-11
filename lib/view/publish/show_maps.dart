import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../providers/location_provider.dart';
import '../../providers/publish_provider.dart';

import '../../res/styles.dart';
import '../components/button_create.dart';

class ShowMaps extends StatefulWidget {
  const ShowMaps({
    Key? key,
  }) : super(key: key);

  @override
  _ShowMapsState createState() => _ShowMapsState();
}

class _ShowMapsState extends State<ShowMaps> {
  final Completer<GoogleMapController> _controllerCompleter = Completer();

  @override
  build(BuildContext context) {
    CameraPosition initialPosition = CameraPosition(
        target: LatLng(
            Provider.of<LocationProvider>(context, listen: false).lat!,
            Provider.of<LocationProvider>(context, listen: false).lng!),
        zoom: 16);

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: initialPosition,
            onMapCreated: (GoogleMapController controller) {
              _controllerCompleter.complete(controller);
            },
            markers: Provider.of<LocationProvider>(context).markers.toSet(),
            onTap: (newPosition) {
              Provider.of<LocationProvider>(context, listen: false)
                  .updateMarker(newPosition);
            },
          ),
          Positioned(
            top: 20 + MediaQuery.of(context).padding.top,
            right: 20,
            child: ButtonCreate(
              title: 'Sélectionner',
              padding: const EdgeInsets.symmetric(horizontal: 0),
              minWidth: 150,
              onPressed: () {
                Provider.of<PublishProvider>(context, listen: false)
                    .colorGPSChanged(true);
                Navigator.of(context).pop();
              },
              color: Styles.principalColor,
            ),
          )
        ],
      ),
    );
  }
}
