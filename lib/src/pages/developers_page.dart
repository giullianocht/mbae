import 'package:flutter/material.dart';
import 'package:mbae/src/widgets/contact_developer.dart';
import 'package:url_launcher/url_launcher.dart';

TextStyle defaultStyle = TextStyle(fontSize: 17, fontFamily: "HeyAugust");

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
                margin: const EdgeInsets.only(bottom: 5.0, top: 20.0),
                child: Text(
                  "¿ Mba'e ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: "HeyAugust",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Container(
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
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
                            fontFamily: "HeyAugust",
                          ),
                        ),
                        ContactDeveloper("Giulliano Albrecht  ",
                            "https://www.instagram.com/giulliano_cht"),
                        ContactDeveloper("Cristhian Ortellado",
                            "https://www.instagram.com/cristhian_ortellado"),
                        ContactDeveloper("Mario Gueyraud     ",
                            "https://www.instagram.com/mariogyd"),
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
                        fontFamily: "HeyAugust",
                      ),
                    ),
                    ContactDeveloper("Nicolás Espínola  ",
                        "https://www.instagram.com/nicoespinolab"),
                  ]))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: Text(
                  "Contacto",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: "HeyAugust",
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
                    fontSize: 17.0,
                    fontFamily: "HeyAugust",
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
