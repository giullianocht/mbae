import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbae/src/routes/routes.dart';

void main() {
  runApp(MyRunApp());
}

class MyRunApp extends StatelessWidget {
  Widget build(BuildContext context) {
    //--------------------------------------------------
    // Servicio que bloquea la orientacion vertical
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    //--------------------------------------------------
    // Servico que oculta todo y deja pantalla completa
    List<SystemUiOverlay> sys = [];
    SystemChrome.setEnabledSystemUIOverlays(sys);
    //--------------------------------------------------
    return MaterialApp(
        title: "¿Mba'e?",
        debugShowCheckedModeBanner: false,
        routes: getApplicationRoutes(),
        initialRoute: '/',
        // home: Scaffold(backgroundColor: Colors.white, body: Home())
        );
  }
}
