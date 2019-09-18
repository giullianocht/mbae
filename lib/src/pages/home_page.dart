import 'dart:async';

import 'package:flutter/material.dart';

import 'package:mbae/src/providers/tarjeta_provider.dart';
import 'package:sensors/sensors.dart';

//Pagina Home
class HomePage extends StatefulWidget{

  
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   // event returned from accelerometer stream
  AccelerometerEvent event;
  // hold a refernce to these, so that they can be disposed
  StreamSubscription accel;
  Timer timerAccelerometer;

  // positions and count
  int count = 0;

  // Timer para los 60 segundos
  Timer _timer;
  int _start = 60;

  //Color
  Color background = Colors.yellow;

  void startTimer(int start) {

    _start = start;

    const oneSec = const Duration(milliseconds: 1000);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            _timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }



  _HomePageState(){
    startTimer(60);
    startAccelerometer();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("$_start",style: TextStyle(fontSize: 30),),
              Container(
                margin: EdgeInsets.only(bottom: 100.0),
                child: Text("Mbae",style: TextStyle(fontSize: 80),)
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
    }else if(z <= -7){
      background = Colors.redAccent;
    }else{
      background = Colors.yellow;      
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
  void dispose() {
    timerAccelerometer?.cancel();
    accel?.cancel();
    super.dispose();
  }
  

// Widget _prueba() {

  //   return FutureBuilder(
  //     future: tarjetaProvider.cargarTarjetas(),
  //     initialData: [],
  //     builder: (BuildContext context, AsyncSnapshot snapshot) {

  //       return ListView(
  //         children: _listaTarjetas(snapshot.data) ,
  //       );
  //     },
  //   );

  // }

  // List<Widget> _listaTarjetas(List<dynamic> data) {
    
  //   final List<Widget> opciones = [];

  //   data.forEach((opt){

  //     final widgetTemp = ListTile(
  //       title: Text(opt['palabra_guarani']),
  //       subtitle: Text(opt['descripcion']),
  //       trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue )
  //     );

  //     opciones..add(widgetTemp)
  //             ..add(Divider());

  //   });

  //   return opciones;
  // }



}