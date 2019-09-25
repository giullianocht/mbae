import 'dart:async';
import 'package:vibration/vibration.dart';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
//import 'package:mbae/src/providers/tarjeta_provider.dart';

import 'package:mbae/src/classes/juego.dart';

//Pagina Home
class JuegoPage extends StatefulWidget{

  
  
  @override
  _JuegoPageState createState() => _JuegoPageState();
}

class _JuegoPageState extends State<JuegoPage> with WidgetsBindingObserver{

   // event returned from accelerometer stream
  AccelerometerEvent event;
  // hold a refernce to these, so that they can be disposed
  StreamSubscription accel;
  Timer timerAccelerometer;

  // positions and count
  int count = 0;

  // Timer para los 60 segundos
  Timer _timer;
  int _start = 10, contadorImagen = 0;

  //Color
  Color background = Colors.yellow;

  //Bandera para controlar el cambio de estado
  bool bandera = true, mostrarImagen = false;

  //Palabra
  String palabra;

  double height, width;


  void startTimer(int start) {

    _start = start;

    const oneSec = const Duration(milliseconds: 1000);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            _timer.cancel();
            Navigator.pushReplacementNamed(context, 'resultados');
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }


  _JuegoPageState(){
    juego.borrar();
    cambiarPalabra();
    startTimer(60);
    startAccelerometer();
  }

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("$_start",style: TextStyle(fontSize: 30),),
              Container(
                width: porcentaje(100, width) ,
                height: porcentaje(60, height),
                // margin: EdgeInsets.only(bottom: 100.0),
                child: mostrarImagen ? imagen() : texto()
                // child: imagen()
              )
            ],
          ),
      )
    );

  }

  startAccelerometer() {
    // if the accelerometer subscription hasn't been created, go ahead and create it
    if (accel == null) {
      accel = accelerometerEvents.listen((AccelerometerEvent eve) {
        setState(() {
          event = eve;
        });
      });
    } else {
      // it has already ben created so just resume it
      accel.resume();
    }

    // Accelerometer events come faster than we need them so a timer is used to only proccess them every 200 milliseconds
    if (timerAccelerometer == null || !timerAccelerometer.isActive) {
      timerAccelerometer = Timer.periodic(Duration(milliseconds: 200), (_) {
        // if count has increased greater than 3 call pause timer to handle success
        if (count > 3) {
          pauseTimer();
        } else {
          // proccess the current event
          setColor(event);
        }
      });
    }


  }

  setColor(AccelerometerEvent event){
    // Calculate Left
    double z = event.z ;

    if(z >= 7) {
      background = Colors.lightGreenAccent;
      Vibration.vibrate();

      if(bandera){
        contadorImagen = 2;
        juego.corregirPalabra(correcto: true);
        bandera = false;
      }

    }else if(z <= -7){
      background = Colors.redAccent;
      Vibration.vibrate();

      if(bandera){
        contadorImagen++;
        if(contadorImagen == 1){
          bandera = false;
        }else if(contadorImagen == 2){
          juego.corregirPalabra(correcto: false);
          bandera = false;
        }
      }

    }else{
      background = Colors.yellow; 
      Vibration.cancel();

      if(!bandera){
        if(contadorImagen == 1){
          mostrarImagen = true;
          bandera = true;
        }else if(contadorImagen == 2){
          mostrarImagen = false;
          cambiarPalabra();
          // cambiarPalabra();
          bandera = true;
          contadorImagen = 0;
        }
      }

    }

    setState(() {});
  }

  pauseTimer() {
    // stop the timer and pause the accelerometer stream
    timerAccelerometer.cancel();
    accel.pause();

    // set the success color and reset the count
    setState(() {
      count = 0;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    timerAccelerometer?.cancel();
    accel?.cancel();
    Vibration.cancel();     
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.paused){
      _timer.cancel();
      timerAccelerometer?.cancel();
      accel.pause();
      Vibration.cancel(); 
    }
    if(state == AppLifecycleState.resumed){
      startTimer(_start);
      accel.resume();
      startAccelerometer();
    }
  }

  //Cambia la palabra
  void cambiarPalabra() async {
    palabra = await juego.obtenerPalabra();
    setState(() {});
  }

  //Muestra imagen
  Widget imagen(){
    String pathImg = juego.obtenerRutaImagen();

    return Center(child: Image.asset(pathImg, fit: BoxFit.fill,));
  }


  //Muestra palabra
  Widget texto(){
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 90.0),
        child: Text("$palabra",style: TextStyle(fontSize: 80),)
      )
      );
  }

  double porcentaje(double porcentaje, double valor){
    return (porcentaje*valor) / 100;
  }

}