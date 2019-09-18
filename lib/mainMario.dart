import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mbae/src/app.dart';

void main() {

  List<SystemUiOverlay> sys = [];

  SystemChrome.setEnabledSystemUIOverlays(sys);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);

  runApp( MyApp() );

}

