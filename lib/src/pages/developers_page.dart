import 'package:flutter/material.dart';
import 'package:mbae/src/widgets/contact_developer.dart';
import 'package:url_launcher/url_launcher.dart';

TextStyle defaultStyle = TextStyle(
  fontSize: 15,
  fontFamily: "CaviarBold",
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Container(
                //Aca
                margin: const EdgeInsets.only(bottom: 5.0, top: 20.0),
                child: Text(
                  "¿ Mba'e ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: "CaviarBold",
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            " \t\tEs un juego para dos o más personas que buscan divertirse y aprender palabras cotidianas en guaraní, consiste en adivinar la palabra mediante mímicas o descripciones teniendo un tiempo limitado para adivinar todas las palabras posibles.",
                      ),
                      TextSpan(
                        text:
                            "\n \t\tEl juego se desarrolló para el concurso de aplicaciones móviles de la XVII Exposición, Tecnológica y Científica “Ñamopu'ã Ñane Ñe'ê” – 2019 de la Facultad Politécnica de la Universidad Nacional de Asunción.",
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              //Aca
              padding: const EdgeInsets.symmetric(vertical: 5.0),
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
                            fontSize: 20.0,
                            fontFamily: "CaviarBold",
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
                        fontSize: 20.0,
                        fontFamily: "CaviarBold",
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
                    fontSize: 20.0,
                    fontFamily: "CaviarBold",
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
                    fontSize: 15.0,
                    fontFamily: "CaviarBold",
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
