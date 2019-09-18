import 'package:flutter/material.dart';
import 'package:mbae/src/pages/preparation_page.dart';

class MyApp extends StatelessWidget{

  @override
  build(BuildContext context) {
    return MaterialApp(
      home: PreparationPage(),
      debugShowCheckedModeBanner: false,
    );  
  }

}