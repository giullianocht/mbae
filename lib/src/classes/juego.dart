


import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;

class _Juego{
   
  List<dynamic> tarjetas;
  List<int> numeros;
  List<dynamic> resultados;
  int salidos;
  Map<String,dynamic> currentTarjeta;
  int cantPalabras = 4;

  _Juego(){
    tarjetas = [];
    numeros = new List(50);
    resultados = [];
    currentTarjeta = {};
    this.salidos = 0;
    generarVector();
  }

  //Obtiene los datos del json 
  Future<List<dynamic>> obtenerTarjetas () async {
    final data = await rootBundle.loadString('data/data.json');
    Map dataMap = json.decode(data);
    tarjetas = dataMap['tarjetas'];

    return tarjetas;
  }

  //Genera los numeros del 1 hasta la cantidad de palabras
  void generarVector(){
    for(int i = 0;i < cantPalabras; i++){
      numeros[i] = i + 1;
    }
  }
  
  //Obtiene un numero random del vector sin repetir 
  int obtenerNumero(){
    var rand = Random();
    int numeroRandom = rand.nextInt(cantPalabras - salidos);
    int aux;
    
    int numero = numeros[numeroRandom];
    
    aux = numeros[(cantPalabras - 1) - salidos];
    numeros[(cantPalabras - 1) - salidos] = numeros[numeroRandom];
    numeros[numeroRandom] = aux;
    
    salidos++;
    
    return numero;
  }

  //Obtiene una palabra nueva
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

  //Corrige la palabra
  void corregirPalabra({bool correcto}){

    Map<String, dynamic> tarjeta = currentTarjeta;
    tarjeta['correcto'] = false;

    if(correcto){
      tarjeta['correcto'] = true;
    }

    resultados.add(tarjeta);

  }

  

}

_Juego juego = new _Juego();