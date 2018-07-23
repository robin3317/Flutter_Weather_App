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
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: null,
          )
        ],
      ),
    );
  }
}