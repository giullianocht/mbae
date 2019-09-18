import 'package:flutter/material.dart';
import 'package:mbae/src/pages/home_page.dart';

class MyApp extends StatelessWidget{

  @override
  build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      
    );  
  }

}