import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

TextStyle defaultStyle = TextStyle(fontSize: 17);

class ContactDeveloper extends StatelessWidget {
  final String _nombre;
  final String _pathinstagram;

  ContactDeveloper(this._nombre, this._pathinstagram);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 3.0),
          child: Container(
            child: Row(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    child: Icon(
                      Icons.assignment_ind,
                      color: Colors.white,
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
