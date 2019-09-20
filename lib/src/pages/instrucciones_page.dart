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
            //Se genera una imagen por pagina
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
            //PARA LA ULTIMA PAGINA SE INSERTA UNA IMAGEN Y UN BOTON DE SALIDA
            Container(
              
                decoration:BoxDecoration(
                  image:DecorationImage( 
                  image:AssetImage('assets/inicio.jpg'),
                  fit: BoxFit.cover
                  ),
                ),
                //padding:MainAxisAlignment.end,
                 padding:EdgeInsets.only(
                  top: 350,
                  left: 220,
                  right: 220,

                  ),
                
                child: RaisedButton(
                  
                          //Vuelve al ultimo activity -
                          onPressed: () {
                            _salir();
                          },
                          child: Text(
                            "Volver al Menu Principal",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              backgroundColor: Color(900),
                              fontStyle: FontStyle.italic,
                              fontFamily: "HeyAugust",

                              
                            ),
                          ),  
                          color:Colors.redAccent,
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
