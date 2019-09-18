import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _TarjetaProvider{
  
  List<dynamic> tarjetas = [];

  _TarjetaProvider();

  Future<List<dynamic>> cargarTarjetas() async {

    final data = await rootBundle.loadString('data/data.json');
    Map dataMap = json.decode(data);
    tarjetas = dataMap['tarjetas'];

    return tarjetas;
  }

}

final tarjetaProvider = new _TarjetaProvider();