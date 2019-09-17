import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Servicio que bloquea la orientacion vertical
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "¿ MBA'E ?",
                style: TextStyle(
                  fontSize: 35.0,
                  fontFamily: "Arial",
                  color: Colors.redAccent,
                ),
              ),
              Padding(padding: EdgeInsets.all(40.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Boton de Jugar
                  RaisedButton(
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    child: Text("Jugar"),
                    onPressed: () {
                      print("Boton de Jugar Presionado");
                    },
                    splashColor: Colors.white,
                  ),
                  //Espacion entre ellos de 20 pixeles
                  Padding(padding: EdgeInsets.all(20.0)),
                  //Boton de Intrucciones
                  RaisedButton(
                    child: Text("Instrucciones"),
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      print("Boton de Instrucciones Presionado");
                    },
                    splashColor: Colors.white,
                  )
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}

imprimirdatos() {
  print("hola");
}
