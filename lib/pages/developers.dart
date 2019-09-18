import 'package:flutter/material.dart';

class DevelopersInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        centerTitle: true,
        title: Text("¿ Mba'e ?"),
        backgroundColor: Colors.lightGreen,
      ),
        body: Center(
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Probando",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
