import 'package:flutter/material.dart';

class Instrucciones extends StatefulWidget {
  @override
  _InstruccionesState createState() => new _InstruccionesState();
}

class _InstruccionesState extends State<Instrucciones> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: PageView(
          children: <Widget>[
            FadeInImage(
              placeholder: AssetImage('assets/vidrio.png'),
              image: AssetImage('assets/prueba1.jpg'),
              fit: BoxFit.fill,
            ),
            FadeInImage(
              placeholder: AssetImage('assets/vidrio.png'),
              image: AssetImage('assets/instruccion2.png'),
              fit: BoxFit.fill,
            ),
            FadeInImage(
              placeholder: AssetImage('assets/vidrio.png'),
              image: AssetImage('assets/instruccion3.jpg'),
              fit: BoxFit.fill,
            ),
            Container(
                decoration:BoxDecoration(
                  image:DecorationImage( 
                  image:AssetImage('assets/animado.gif'),
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
