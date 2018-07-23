import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

final appId = "c85a08c4c0785a7b6f225056bc4f39c5";
final defaultCity = "Dhaka";

class WeatherUpdate extends StatefulWidget {
  @override
  _WeatherUpdateState createState() => _WeatherUpdateState();
}

class _WeatherUpdateState extends State<WeatherUpdate> {

//get data and print it on the console
  void showData() async {
    Map data = await getWeather(appId, defaultCity);
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Weather Update"),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: showData,
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
          ),
          //this container will contain the actual data
          new Container(
            alignment:Alignment.center,
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 180.0),
            child: new Text(
              "45.5F",
              style: new TextStyle(
                fontSize: 28.90,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ) 
        ],
      )

    );
  }
  Future<Map> getWeather(String appId, String city) async {
    String apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$appId&units=metric";
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }
}

//text style
TextStyle cityStyle() {
  return new TextStyle(
    color: Colors.white,
    fontSize: 30.0,
  );
}