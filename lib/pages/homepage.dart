import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data1 = {};

  @override
  Widget build(BuildContext context) {

    data1 = data1.isNotEmpty ? data1 : ModalRoute.of(context).settings.arguments ;

    String bgimage = data1['isDaytime'] ? 'day.png' : 'night.png' ;
    //print(data1);
    Color bgcolor = data1['isDaytime'] ? Colors.blue[600] : Colors.black45 ;

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image:  DecorationImage(
              image: AssetImage('assets/$bgimage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0 ,55.0,20.0,10.0),
            child: Column(
                children: <Widget>[

                  FlatButton.icon(
                      onPressed: () async {

                        dynamic res =  await Navigator.pushNamed(context, '/worldlocation');
                        setState(() {
                          data1 = {
                            'location'  : res['location'],
                            'time'      : res['time'],
                            'isDaytime' : res['isDaytime'],
                            'Flag'      : res['Flag']
                          };
                        });
                      },
                      icon: Icon(Icons.add,
                          color: data1['isDaytime']  ? Colors.black : Colors.tealAccent),

                      label: Text('edit world loacation',
                        style:  TextStyle(
                          color: data1['isDaytime']  ? Colors.black : Colors.tealAccent,

                          letterSpacing: 2.0,
                        ),
                      )
                  ),
                  SizedBox(height: 40.0),
                  FlatButton.icon(
                    onPressed: () async {
                    dynamic result =  await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data1 = {
                        'location'  : result['location'],
                        'time'      : result['time'],
                        'isDaytime' : result['isDaytime'],
                        'Flag'      : result['Flag']
                      };
                    });
                    },
                    icon: Icon(Icons.add_location,
                        color: data1['isDaytime']  ? Colors.black : Colors.tealAccent),

                    label: Text('edit loacation',
                    style:  TextStyle(
                      color: data1['isDaytime']  ? Colors.black : Colors.tealAccent,

                      letterSpacing: 2.0,
                    ),
                    )
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment : MainAxisAlignment.center,
                    children: <Widget>[

                      Text(
                        data1['location'],


                        style:  TextStyle(
                          fontSize: 20.0,
                          color: data1['isDaytime']  ? Colors.black : Colors.tealAccent,

                          letterSpacing: 2.0,
                            ),
                          ),
                        ]
                      ),
                     SizedBox(height:15.0),
                     Text(
                        data1['time'],
                        style: TextStyle(
                          fontSize: 50.0,
                          color: data1['isDaytime']  ? Colors.black : Colors.tealAccent,
                          letterSpacing: 2.0,
                        ),
                      )

                    ],
              ),
          ),
        ),
      ),
    );
  }
}
