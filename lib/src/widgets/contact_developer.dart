import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

TextStyle defaultStyle = TextStyle(
  fontSize: 25,
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

class ContactDeveloper extends StatelessWidget {
  final String _nombre;
  final String _pathinstagram;

  ContactDeveloper(this._nombre, this._pathinstagram);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Padding(
          //Aca
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 3.0),
          child: Container(
            child: Row(
              //Aca
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        style: defaultStyle,
                        text: "- " + _nombre,
                      ),
                    ),
                  ],
                ),
                Container(
                  //Aca
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    child: Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.purple,
                    ),
                    onTap: () {
                      launch(_pathinstagram);
                    },
                  ),
                ),
              ],
            ),
          ))
    ]));
  }
}
