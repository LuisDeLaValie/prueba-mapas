import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MiUbicaionProvider with ChangeNotifier {
  StreamSubscription<Position>? _positionStream;

  LatLng? currentPosition;

  void iniciarSegimiento() {

    var seting = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 3,
    );
    _positionStream = Geolocator.getPositionStream(locationSettings: seting)
        .listen((position) {
      print(position);
      currentPosition = LatLng(position.latitude, position.longitude);
      notifyListeners();
    });
  }

  void finalizarSeguimiento() {
    _positionStream?.cancel();
  }

  @override
  void dispose() {
    finalizarSeguimiento();
    super.dispose();
  }
}
