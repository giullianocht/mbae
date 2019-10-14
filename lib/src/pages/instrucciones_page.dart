import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Instrucciones extends StatefulWidget {
  @override
  _InstruccionesState createState() => new _InstruccionesState();
}

class _InstruccionesState extends State<Instrucciones> {
  double height, width;
  int paginaActual = 0;

  PageController pagina = PageController();
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home, size: 25.0, color: Colors.white),
        elevation: 50.0,
        backgroundColor: Colors.transparent,
        onPressed: () {
          print("Boton Flotante presionado");
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: porcentaje(80, height),
                child: PageView(
                  onPageChanged: (pagina) {
                    paginaActual = pagina;
                    setState(() {});
                  },
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true,
                  controller: pagina,
                  children: <Widget>[
                    //Se genera una imagen por pagina
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset(
                            'assets/instrucciones/gesto_correcto.png',
                            width: porcentaje(30, width),
                          ),
                          Text(
                              'Inclina el teléfono boca arriba si adivinaste la palabra'),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset(
                            'assets/instrucciones/gesto_ayuda.png',
                            width: porcentaje(30, width),
                          ),
                          Text(
                              'Inclina el teléfono boca abajo y veras una imagen de la palabra como ayuda')
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset(
                            'assets/instrucciones/gesto_incorrecto.png',
                            width: porcentaje(30, width),
                          ),
                          Text(
                              'Si vuelves a inclinar el teléfono boca abajo luego de ver la imagen estarás pasando la palabra')
                        ],
                      ),
                    ),
                    //PARA LA ULTIMA PAGINA SE INSERTA UNA IMAGEN Y UN BOTON DE SALIDA
                    Center(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.timer),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                  "Trata de adivinar tantas palabras como sea posible antes de que se acabe el tiempo"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: DotsIndicator(
                  dotsCount: 4,
                  position: paginaActual,
                  decorator: DotsDecorator(
                    activeColor: Colors.redAccent,
                    // size: const Size.square(9.0),
                    // activeSize: const Size(18.0, 9.0),
                    // activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
                  ),
                ),
              )
            ]),
      ),
    );
  }

  double porcentaje(double porcentaje, double valor) {
    return (porcentaje * valor) / 100;
  }
}
