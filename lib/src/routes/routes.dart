import 'package:flutter/material.dart';
import 'package:mbae/src/pages/developers_page.dart';
import 'package:mbae/src/pages/home_page.dart';
import 'package:mbae/src/pages/instrucciones_page.dart';
import 'package:mbae/src/pages/juego_page.dart';
import 'package:mbae/src/pages/preparacion_page.dart';
import 'package:mbae/src/pages/resultados_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'preparacion': (BuildContext context) => PreparationPage(),
    'juego': (BuildContext context) => JuegoPage(),
    'instrucciones': (BuildContext context) => Instrucciones(),
    'developers': (BuildContext context) => DevelopersInfo(),
    'resultados': (BuildContext context) => ResultadosPage(),
    '/': (BuildContext context) => Home(),
  };
}
