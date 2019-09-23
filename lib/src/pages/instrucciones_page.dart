import 'package:flutter/material.dart';

class Instrucciones extends StatefulWidget {
  @override
  _InstruccionesState createState() => new _InstruccionesState();
}

class _InstruccionesState extends State<Instrucciones> {
  PageController pagina =PageController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: PageView(
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
          controller: pagina,
          
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
                  image:AssetImage('assets/bosques-hojas.gif'),
                  fit: BoxFit.cover
                  ),
                ),
                //padding:MainAxisAlignment.end,
                 padding:EdgeInsets.only(
                  top: 180,
                  //left: 180,
                  //right: 180,

                  ),
                child:Column(
                children:<Widget>[ 
                    RaisedButton(
                          //Vuelve al ultimo activity -
                          onPressed: () {
                            _salir();
                          },
                          child: Text(
                            "Volver al Menu Principal",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 30,
                              //backgroundColor: Color(900),
                              fontStyle: FontStyle.italic,
                              fontFamily: "HeyAugust",
                            ),
                          ),  
                          color:Color(900),
                          textColor: Colors.redAccent,
                          splashColor: Colors.green,
                        ),
                        RaisedButton(
                          onPressed: (){_leernuevo();},
                          child: Text(
                            "Volver a leer las Instrucciones",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 30,
                              backgroundColor: Color(900),
                              fontStyle: FontStyle.italic,
                              fontFamily: "HeyAugust",
                            ),
                          ),
                          color:Color(900),
                          textColor: Colors.white,
                          splashColor: Colors.green,
                        )
                ],
                ),
              ),
            
          ],
          
          
        ),
      ),
    );
  }
  
  void _leernuevo(){
    pagina.jumpToPage(0);
  }
  void _salir() {
    Navigator.pop(context);
  }
}
