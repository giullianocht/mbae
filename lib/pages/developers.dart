import 'package:flutter/material.dart';

class DevelopersInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "HOLA TEAM",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
