import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LoaingPage extends StatelessWidget {
  const LoaingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkGPSLocations(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future checkGPSLocations(BuildContext context) async {
    var permisosGPS = await Permission.location.isGranted;
    var gpsActivo = await Geolocator.isLocationServiceEnabled();

    if (permisosGPS && gpsActivo) {
      Navigator.of(context).pushReplacementNamed('map');
    } else {
      if (!permisosGPS) {
        Navigator.pushNamed(context, 'acces');
      } else if (!gpsActivo) {
        await Geolocator.openLocationSettings();
      }
    }
  }
}
