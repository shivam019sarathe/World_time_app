import 'package:flutter/material.dart';
import 'package:world_time/world_time/world_time.dart' ;
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  
  void worldtimeapp() async {

    WorldTime instance = WorldTime(location: 'Kolkata' , Flag: 'India' , url: 'Asia/Kolkata' );
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home', arguments: {

      'location' : instance.location,
      'Flag'     : instance.Flag,
      'time'     : instance.time,
      'isDaytime': instance.isDaytime,
    });
    

  }


  @override
  void initState() {
    super.initState();
    worldtimeapp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SpinKitWave(
          color: Colors.black,
          size: 40.0,
        ),
      )
    );
  }
}

