import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(new MaterialApp(
    home: Mypage(),
  ));
}

class Mypage extends StatefulWidget {
  @override
  _MypageState createState() => new _MypageState();
}

class _MypageState extends State<Mypage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: PageView(
          children: <Widget>[
            FadeInImage(
              placeholder: AssetImage('imagenes/vidrio.png'),
              image: AssetImage('imagenes/prueba1.jpg'),
              fit: BoxFit.fill,
            ),
            FadeInImage(
              placeholder: AssetImage('imagenes/vidrio.png'),
              image: AssetImage('imagenes/instruccion2.png'),
              fit: BoxFit.fill,
            ),
            FadeInImage(
              placeholder: AssetImage('imagenes/vidrio.png'),
              image: AssetImage('imagenes/instruccion3.jpg'),
              fit: BoxFit.fill,
            ),
            Container(
                decoration:BoxDecoration(
                  image:DecorationImage( 
                  image:AssetImage('imagenes/animado.gif'),
                  fit: BoxFit.cover
                  ),
                ),
                padding: EdgeInsets.only(top: 370),
                child: RaisedButton(
                          //Vuelve al ultimo activity -
                          onPressed: () {
                            _salir();
                          },
                          child: Text(
                            "Salir",
                          ),  
                          color: Colors.indigo,
                          textColor: Colors.white,
                          splashColor: Colors.green,
                        ),
              ),

          ],
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
        ),
      ),
    );
  }

  void _salir() {
    Navigator.pop(context);
  }
}
