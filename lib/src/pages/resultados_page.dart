import 'package:flutter/material.dart';

import 'package:mbae/src/classes/juego.dart';


class ResultadosPage extends StatelessWidget {
  const ResultadosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/inicio.jpg"), fit: BoxFit.cover)),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(color: Colors.white70),
              child: ListView(
                padding: EdgeInsets.only(top: 20.0),
                children: mostrarResultados()
              ),
            )
          ),
        )
        
      );
  }

  List<Widget> mostrarResultados(){

    final List<dynamic> resultados = juego.obtenerResultados();
    final List<Widget> result = [];

    result.add(Center(
                    child: Text("Resultados", style: TextStyle(fontSize: 50.0,
                      fontFamily: "HeyAugust",
                      ) ,),
                  )
              );
    
    resultados.forEach((resultado){

      Icon iconTemp;

      iconTemp = Icon(Icons.cancel, color: Colors.red);

      if(resultado['correcto']){
        iconTemp = Icon(Icons.check_circle, color: Colors.green);
      }

      final widgetTemp = ListTile(
                    title: Text( resultado['palabra_guarani'] , style: TextStyle(fontSize: 25.0) ),
                    leading: iconTemp,
                    trailing: Icon(Icons.arrow_right),
                  );

      result..add(widgetTemp)
            ..add(Divider());

    });

    return result;

  }


}