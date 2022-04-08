import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return Scaffold(
      body: Consumer<MiUbicaionProvider>(
        builder: (context, ubicacion, child) {
          if (ubicacion.currentPosition == null) {
            return const Center(child: Text("Sin ubicación"));
          }
          return Center(
              child: Text(
                  "latitud:${ubicacion.currentPosition?.latitude} longitud:${ubicacion.currentPosition?.longitude}"));
        },
      ),
    );
  }
}
