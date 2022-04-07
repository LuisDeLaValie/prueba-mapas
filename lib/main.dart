import 'package:flutter/material.dart';
import 'package:prueba_mapas/ui/pages/acceso_aps_page.dart';
import 'package:prueba_mapas/ui/pages/loaing_page.dart';
import 'package:prueba_mapas/ui/pages/mapa_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const LoaingPage(),
      routes: {
        'map': (BuildContext context) => const MapaPage(),
        'loading': (BuildContext context) => const LoaingPage(),
        'acces': (BuildContext context) => const AccesoApsPage(),
      },
    );
  }
}
