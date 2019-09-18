import 'dart:async';

import 'package:flutter/material.dart';

import 'package:mbae/src/providers/tarjeta_provider.dart';

//Pagina Home
class HomePage extends StatefulWidget{
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer _timer;
  int _start = 60;

  void startTimer(int start) {

    _start = start;

    const oneSec = const Duration(milliseconds: 1000);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            _timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }



  _HomePageState(){
    startTimer(10);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("$_start",style: TextStyle(fontSize: 30),),
              Container(
                margin: EdgeInsets.only(bottom: 100.0),
                child: Text("Mbae",style: TextStyle(fontSize: 80),)
              )
            ],
          ),
      )
    );

  }

  

// Widget _prueba() {

  //   return FutureBuilder(
  //     future: tarjetaProvider.cargarTarjetas(),
  //     initialData: [],
  //     builder: (BuildContext context, AsyncSnapshot snapshot) {

  //       return ListView(
  //         children: _listaTarjetas(snapshot.data) ,
  //       );
  //     },
  //   );

  // }

  // List<Widget> _listaTarjetas(List<dynamic> data) {
    
  //   final List<Widget> opciones = [];

  //   data.forEach((opt){

  //     final widgetTemp = ListTile(
  //       title: Text(opt['palabra_guarani']),
  //       subtitle: Text(opt['descripcion']),
  //       trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue )
  //     );

  //     opciones..add(widgetTemp)
  //             ..add(Divider());

  //   });

  //   return opciones;
  // }



}