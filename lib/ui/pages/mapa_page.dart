import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:prueba_mapas/providers/mapa.dart';
import 'package:prueba_mapas/providers/mi_ubicaion.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<MiUbicaionProvider>(context, listen: false).iniciarSegimiento();
  }

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<MapaProvider>(context);
    return Scaffold(
      body: Consumer<MiUbicaionProvider>(
        builder: (context, ubicacion, child) {
          if (ubicacion.currentPosition == null) {
            return const Center(child: Text("Sin ubicación"));
          }

          var inicialPosicion = CameraPosition(
            target: ubicacion.currentPosition!,
            zoom: 15,
          );
          return GoogleMap(
            initialCameraPosition: inicialPosicion,
            zoomControlsEnabled: false,
            onMapCreated: pro.onmapController,
            myLocationEnabled: true,
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.my_location),
            onPressed: () {
              var pos = Provider.of<MiUbicaionProvider>(context, listen: false)
                  .currentPosition;
              print(pos);
              pro.onCamaraUpdate(pos!);
            },
          ),
          // FloatingActionButton(
          //   child: Icon(Icons.refresh),
          //   onPressed: () {
          //     // Provider.of<MapaProvider>(context, listen: false).recargar();
          //   },
          // ),
        ],
      ),
    );
  }
}
