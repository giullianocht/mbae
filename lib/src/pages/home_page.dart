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

  int _start;

  void startTimer(int start) {

    _start = start;

    const oneSec = const Duration(milliseconds: 1000);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: Text("$_start",style: TextStyle(fontSize: 30),)
          ),
          SizedBox(
            height: 120.0,
          ),
           Center(
            child: Text("Mbae",style: TextStyle(fontSize: 80),)
          )
        ],
      ),
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