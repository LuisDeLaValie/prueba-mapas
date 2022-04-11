import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaProvider with ChangeNotifier {
  GoogleMapController? mapController;

  onmapController(GoogleMapController controller) {
    if (mapController == null) {
      print("Inicio controller");
      mapController = controller;
      notifyListeners();
    }
  }

  onCamaraUpdate(LatLng position) {
    mapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: position,
          zoom: 15,
        ),
      ),
    );
  }
}
