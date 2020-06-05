import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';


class WorldTime {

  String Flag ;
  String url ;
  String time ;
  String location ;
  bool isDaytime;



  WorldTime({this.url , this.Flag , this.location });

  Future<void> getTime() async {
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    //print(data);
    String datetime = data['datetime'];
    String offset_hour   = data['utc_offset'].substring(1,3);
    String offset_min   = data['utc_offset'].substring(4);

    //print(offset_min);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours:int.parse(offset_hour),minutes: int.parse(offset_min)));
    isDaytime = now.hour > 5 && now.hour < 19 ? true : false ;
    time = DateFormat.jm().format(now);
  }
}