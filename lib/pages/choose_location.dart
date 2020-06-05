import 'package:flutter/material.dart';
import 'package:world_time/world_time/world_time.dart' ;


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  var i;



List<WorldTime> locations = [
  WorldTime(location: 'Kolkata' , Flag: 'India.png' , url: 'Asia/Kolkata' ),
  WorldTime(location: 'Chicago' , Flag: 'America.png' , url: 'America/Chicago' ),
  WorldTime(location: 'Los Angeles' , Flag: 'America.png' , url: 'America/Los_Angeles' ),
  WorldTime(location: 'Dhaka' , Flag: 'Bangladesh.png' , url: 'Asia/Dhaka' ),
  WorldTime(location: 'Hong Kong' , Flag: 'Japan.png' , url: 'Asia/Hong_Kong' ),
  WorldTime(location: 'Sydney' , Flag: 'Australia.png' , url: 'Australia/Sydney' ),
  WorldTime(location: 'Melbourne' , Flag: 'Australia.png' , url: 'Australia/Melbourne' ),
  WorldTime(location: 'Havana' , Flag: 'America.png' , url: 'America/Havana' ),
  WorldTime(location: 'Colombo' , Flag: 'Srilanka.png' , url: 'Asia/Colombo' ),
  WorldTime(location: 'Chicago' , Flag: 'America.png' , url: 'America/Chicago' ),
  WorldTime(location: 'Chicago' , Flag: 'America.png' , url: 'America/Chicago' ),
];

 void Updatetime(index) async {

   WorldTime instance = locations[index];
   await instance.getTime();
   //navigate to home page
   Navigator.pop(context,{
     'location' : instance.location,
     'Flag'     : instance.Flag,
     'time'     : instance.time,
     'isDaytime': instance.isDaytime,

      }
      );

    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Choose Location '),
        centerTitle: true,
        elevation: 0.0,
      ),
    body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal:1.0  , vertical:4.0 ),
            child: Card(
              color: Colors.grey[500],
              child: ListTile(

                onTap: (){

                   Updatetime(index);

                },
                title: Text(locations[index].location),
                leading: CircleAvatar(


                  backgroundImage: AssetImage('assets/${locations[index].Flag}' ) ,

                ),
              ),

            ),
          );
        },
    ),
    );
  }
}
