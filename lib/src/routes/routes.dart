import 'package:flutter/material.dart';
import 'package:mbae/src/pages/home_page.dart';
import 'package:mbae/src/pages/preparation_page.dart';

Map <String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    'preparacion': (BuildContext context) => PreparationPage(),
    'juego': (BuildContext context) => HomePage(),
  };
}