import 'package:flutter/material.dart';
import 'package:mbae/src/widgets/contact_developer.dart';
import 'package:url_launcher/url_launcher.dart';

TextStyle defaultStyle = TextStyle(
  fontSize: 20,
  fontFamily: "HeyAugust",
  shadows: <Shadow>[
    Shadow(
      offset: Offset(1.0, 1.0),
      blurRadius: 5.0,
      color: Colors.black,
    ),
    Shadow(
      offset: Offset(1.0, 1.0),
      blurRadius: 5.0,
      color: Colors.green,
    ),
  ],
);

class DevelopersInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home, size: 25.0, color: Colors.white),
        elevation: 50.0,
        backgroundColor: Colors.transparent,
        onPressed: () {
          print("Boton Flotante presionado");
          Navigator.pop(context);
        },
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/informacion/fondo_informacion.png"),
                fit: BoxFit.fill)),
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                //Aca
                margin: const EdgeInsets.only(bottom: 5.0, top: 20.0),
                child: Text(
                  "¿ Mba'e ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: "HeyAugust",
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 5.0,
                        color: Colors.black,
                      ),
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 5.0,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              //Aca
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Container(
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            " \t\tEs un juego para dos o mas personas que buscan divertirse y aprender palabras cotidianas en guarani, consiste en adivinar la palabra mediante mimicas o descripciones teniendo un tiempo limitado para adivinar todas las palabras posibles.",
                      ),
                      TextSpan(
                        text:
                            "\n \t\tEl juego se desarrollo para el concurso de aplicaciones moviles en la Exposicion , Tecnologia y Ciencias 2019 de la Facultad Politecnica de la Universidad Nacional de Asuncion con el lema Ñamopua Ñande Ñee.",
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              //Aca
              padding: const EdgeInsets.all(0.0),
              child: Row(
                //Aca
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Desarrolladores",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                            fontFamily: "HeyAugust",
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 5.0,
                                color: Colors.black,
                              ),
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 5.0,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            //Aca
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ContactDeveloper("Giulliano Albrecht",
                                  "https://www.instagram.com/giulliano_cht"),
                              ContactDeveloper("Cristhian Ortellado",
                                  "https://www.instagram.com/cristhian_ortellado"),
                              ContactDeveloper("Mario Gueyraud",
                                  "https://www.instagram.com/mariogyd"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      child: Column(children: <Widget>[
                    Text(
                      "Diseño",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontFamily: "HeyAugust",
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 5.0,
                            color: Colors.black,
                          ),
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 5.0,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                    ContactDeveloper("Nicolás Espínola",
                        "https://www.instagram.com/nicoespinolab"),
                  ]))
                ],
              ),
            ),
            Padding(
              //aca
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: Center(
                child: Text(
                  "Contacto",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontFamily: "HeyAugust",
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 5.0,
                        color: Colors.black,
                      ),
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 5.0,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                child: Text(
                  "mbae.app@gmail.com",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontFamily: "HeyAugust",
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 5.0,
                        color: Colors.black,
                      ),
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 5.0,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  launch("mailto:mbae.app@gmail.com");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
