


import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;

class _Juego{
   
  List<dynamic> _tarjetas;
  List<int> numeros;
  List<dynamic> _resultados;
  int salidos;
  Map<String,dynamic> _currentTarjeta;
  int cantPalabras = 70;

  _Juego(){
    borrar();
  }

  //Borrar datos
  void borrar(){
    _tarjetas = [];
    numeros = new List(70);
    _resultados = [];
    _currentTarjeta = {};
    this.salidos = 0;
    generarVector();
  }

  //Obtiene los datos del json 
  Future<List<dynamic>> obtenerTarjetas () async {
    final data = await rootBundle.loadString('data/data.json');
    Map dataMap = json.decode(data);
    _tarjetas = dataMap['tarjetas'];

    return _tarjetas;
  }

  //Genera los numeros del 1 hasta la cantidad de palabras
  void generarVector(){
    for(int i = 0;i < cantPalabras; i++){
      numeros[i] = i + 1;
    }
  }
  
  //Obtiene un numero random del vector sin repetir 
  Future<int> obtenerNumero() async {
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

    if(_tarjetas.length == 0){
      _tarjetas = await obtenerTarjetas();
    }

    id = await obtenerNumero();

    for(Map<String,dynamic> tar in _tarjetas){
      if(tar['id'] == id){
        _currentTarjeta = tar;
      }
    }

    return _currentTarjeta['palabra_guarani'];

  }

  //Corrige la palabra
  void corregirPalabra({bool correcto}){
    if(_currentTarjeta.isNotEmpty){
  
      Map<String, dynamic> tarjeta = _currentTarjeta;
      tarjeta['correcto'] = false;

      if(correcto){
        tarjeta['correcto'] = true;
      }

      if(_resultados.contains(tarjeta)){
        return;
      }

      _resultados.add(tarjeta);

    }

  }

  //Obtener Resultados
  List<dynamic> obtenerResultados(){
    return _resultados; 
  }

  //Obtener ruta de imagen
  String obtenerRutaImagen(){
    return _currentTarjeta['img'];
  }

  

}

_Juego juego = new _Juego();