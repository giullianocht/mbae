import 'package:flutter/material.dart';
import 'package:mbae/src/pages/preparation_page.dart';
import 'package:mbae/src/routes/routes.dart';

class MyApp extends StatelessWidget{

  @override
  build(BuildContext context) {
    return MaterialApp(
      home: PreparationPage(),
      routes: getApplicationRoutes(),
      debugShowCheckedModeBanner: false,
    );  
  }

}