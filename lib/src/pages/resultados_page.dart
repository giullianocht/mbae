import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'package:mbae/src/classes/juego.dart';


class ResultadosPage extends StatefulWidget {
  const ResultadosPage({Key key}) : super(key: key);

  @override
  _ResultadosPageState createState() => _ResultadosPageState();
}

class _ResultadosPageState extends State<ResultadosPage> {

  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();


  _ResultadosPageState(){
    _assetsAudioPlayer.open(AssetsAudio(
      asset: "accomplished.mp3",
      folder: "assets/",
    ));

    _assetsAudioPlayer.playOrPause();
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/inicio.jpg"), fit: BoxFit.cover)),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(color: Colors.white70),
              child: Column(
                
                children: <Widget>[
                  Center(
                    child: Text("Resultados", style: TextStyle(fontSize: 50.0,
                      fontFamily: "HeyAugust",color: Colors.redAccent
                      ) ,),
                  ),
                  Container(
                    height: porcentaje(59.3, height) ,
                    child: ListView(
                      padding: EdgeInsets.only(top: 20.0),
                      children: mostrarResultados()
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.redAccent,
                        child: Icon(Icons.home,color: Colors.white,),
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, '/');
                        },
                      ),
                      Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0),),
                      RaisedButton(
                        color: Colors.redAccent,
                        child: Icon(Icons.restore,color: Colors.white,),
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, 'preparacion');
                        },
                      )
                    ],
                  )
                ] 
              ),
            )
          ),
        )
        
      );
  }

  List<Widget> mostrarResultados(){

    final List<dynamic> resultados = juego.obtenerResultados();
    final List<Widget> result = [];
    
    resultados.forEach((resultado){

      Icon iconTemp;

      iconTemp = Icon(Icons.cancel, color: Colors.red);

      if(resultado['correcto']){
        iconTemp = Icon(Icons.check_circle, color: Colors.green);
      }

      final widgetTemp = ListTile(
                    title: Text( resultado['palabra_guarani'] , style: TextStyle(fontSize: 25.0) ),
                    subtitle: Text( resultado['palabra_espanol'] , style: TextStyle(fontSize: 15.0) ),
                    leading: iconTemp,
                    trailing: Icon(Icons.arrow_right),
                  );

      result..add(widgetTemp)
            ..add(Divider());

    });

    // for (var i = 0; i < 10; i++) {
    //   Icon iconTemp;

    //   iconTemp = Icon(Icons.cancel, color: Colors.red);

      

    //   final widgetTemp = ListTile(
    //                 title: Text( "Hola", style: TextStyle(fontSize: 25.0) ),
    //                 subtitle: Text( "Hola" , style: TextStyle(fontSize: 15.0) ),
    //                 leading: iconTemp,
    //                 trailing: Icon(Icons.arrow_right),
    //               );

    //   result..add(widgetTemp)
    //         ..add(Divider());
    // }

    return result;

  }

  double porcentaje(double porcentaje, double valor){
    return (porcentaje*valor) / 100;
  }
}