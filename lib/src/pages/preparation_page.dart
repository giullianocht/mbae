import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mbae/src/pages/home_page.dart';

class PreparationPage extends StatefulWidget {
  PreparationPage({Key key}) : super(key: key);

  _PreparationPageState createState() => _PreparationPageState();
}

class _PreparationPageState extends State<PreparationPage> {

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
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            _timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  _PreparationPageState(){
    startTimer(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
         child: Column(
           children: <Widget>[
             
           Text("Colocar el dispositivo en la frente"),
           Text("$_start!")
           ],
         ),
       ),
    );
  }
}