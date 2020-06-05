import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/homepage.dart' ;
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/world_location.dart';



void main() => runApp(MaterialApp(
  initialRoute: '/' ,
  routes: {
    '/'         : (context) => Loading() ,
    '/home'     : (context) => Home() ,
    '/location' : (context) => ChooseLocation(),
    '/worldlocation' : (context) => ChooseWorldLocation(),

  },
));

