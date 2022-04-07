import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AccesoApsPage extends StatefulWidget {
  const AccesoApsPage({Key? key}) : super(key: key);

  @override
  State<AccesoApsPage> createState() => _AccesoApsPageState();
}

class _AccesoApsPageState extends State<AccesoApsPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (await Permission.location.status.isGranted) {
        Navigator.of(context).pushReplacementNamed('loading');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Es necesario el acceso GPS a la aplicación."),
            MaterialButton(
              child:
                  const Text("Aceptar", style: TextStyle(color: Colors.white)),
              color: Colors.black,
              shape: const StadiumBorder(),
              elevation: 0,
              splashColor: Colors.transparent,
              onPressed: () async {
                var status = await Permission.location.request();
                accesoGPS(status);
              },
            )
          ],
        ),
      ),
    );
  }

  void accesoGPS(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.granted:
        Navigator.pushNamed(context, 'map');
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.limited:
        openAppSettings();
        break;
    }
  }
}
