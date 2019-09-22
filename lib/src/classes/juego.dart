


import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;

class _Juego{
   
  List<dynamic> tarjetas = [];
  List<int> numeros = new List(50);
  List<dynamic> resultados = [];
  int salidos;
  Map<String,dynamic> currentTarjeta = {};

  _Juego(){
    this.salidos = 0;
    generarVector();
  }


  Future<List<dynamic>> obtenerTarjetas () async {
    final data = await rootBundle.loadString('data/data.json');
    Map dataMap = json.decode(data);
    tarjetas = dataMap['tarjetas'];

    return tarjetas;
  }

  void generarVector(){
    for(int i = 0;i < 50; i++){
      numeros[i] = i + 1;
    }
  }
  
  int obtenerNumero(){
    var rand = Random();
    int numeroRandom = rand.nextInt(50 - salidos);
    int aux;
    
    int numero = numeros[numeroRandom];
    
    aux = numeros[49 - salidos];
    numeros[49 - salidos] = numeros[numeroRandom];
    numeros[numeroRandom] = aux;
    
    salidos++;
    
    return numero;
  }

  Future<String> obtenerPalabra() async{
    int id = -1;

    if(tarjetas.length == 0){
      tarjetas = await obtenerTarjetas();
    }

    id = obtenerNumero();

    for(Map<String,dynamic> tar in tarjetas){
      if(tar['id'] == id){
        currentTarjeta = tar;
      }
    }

    return currentTarjeta['palabra_guarani'];

  }

  void corregirPalabra(bool correcto){

    if(correcto){
      resultados.add({
        "id_palabra": currentTarjeta['id'],
        "correcto": true
      });
    }else{
      resultados.add({
        "id_palabra": currentTarjeta['id'],
        "correcto": true
      });
    }

  }

}

_Juego juego = new _Juego();