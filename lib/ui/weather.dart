import 'package:flutter/material.dart';

class WeatherUpdate extends StatefulWidget {
  @override
  _WeatherUpdateState createState() => _WeatherUpdateState();
}

class _WeatherUpdateState extends State<WeatherUpdate> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Weather Update"),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: null,
          )
        ],
      ),

      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset(
              'images/image3.jpg', 
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          new Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 0.0),
            child: new Text("Dhaka", style: cityStyle(),),
          )
        ],
      )
      
    );
  }
}

//text style
TextStyle cityStyle() {
  return new TextStyle(
    color: Colors.white,
    fontSize: 30.0,
    fontWeight: FontWeight.bold
  );
}