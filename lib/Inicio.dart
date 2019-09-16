import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Inicio extends StatelessWidget {
  @override
  // Servicio que bloquea la orientacion vertical
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[100],
        body: Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Bienvenido a Mbae"),
              Padding(padding: EdgeInsets.all(40.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Texto Primario
                  Text("Jugar"),
                  Padding(padding: EdgeInsets.all(20.0)),
                  //Segundo Texto
                  Text("Instrucciones"),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
