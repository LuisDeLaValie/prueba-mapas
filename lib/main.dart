import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_mapas/providers/mi_ubicaion.dart';
import 'package:prueba_mapas/ui/pages/acceso_aps_page.dart';
import 'package:prueba_mapas/ui/pages/loaing_page.dart';
import 'package:prueba_mapas/ui/pages/mapa_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MiUbicaionProvider>(
      create: (context) => MiUbicaionProvider(),
      child: MaterialApp(
        // debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: const LoaingPage(),
        routes: {
          'map': (BuildContext context) => const MapaPage(),
          'loading': (BuildContext context) => const LoaingPage(),
          'acces': (BuildContext context) => const AccesoApsPage(),
        },
      ),
    );
  }
}
