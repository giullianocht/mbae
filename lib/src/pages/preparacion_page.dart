import 'dart:async';
import 'package:flutter/material.dart';

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
            Navigator.pushReplacementNamed(context, 'juego');
            _timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  _PreparationPageState() {
    startTimer(5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Colocar el dispositivo en la frente",
              style: TextStyle(
                fontSize: 35.0,
              ),
            ),
            Text(
              "el juego comienza en",
              style: TextStyle(
                fontSize: 35.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(
                Icons.arrow_downward,
                size: 35.0,
              ),
            ),
            Text(
              "$_start",
              style: TextStyle(
                fontSize: 45.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
