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
  // void showData() async {
  //   Map data = await getWeather(appId, defaultCity);
  //   print(data.toString());
  // }
  Future _goToChangeCity(BuildContext context) async {
    Map results = await Navigator.of(context).push(
      new MaterialPageRoute<Map>(
        builder: (BuildContext context) {
          return new ChageCity();
        }
      )
    );
    if (results != null && results.containsKey("city")) {
      debugPrint(results['city']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Weather Update"),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () => _goToChangeCity(context),
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
            margin: const EdgeInsets.fromLTRB(80.0, 50.0, 10.0, 10.0),
            child: updateWidget("Dhaka")
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
  Widget updateWidget(String city) {
    return new FutureBuilder(
      future: getWeather(appId, city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        if (snapshot.hasData) {
          Map content = snapshot.data;
          return new Container(
            child: new Column(
              children: <Widget>[
                new ListTile(
                  title: new Text(
                    "${content['main']['temp'].toString()} C",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                )
              ],
            ),
          );
        }else {
          return new Container();
        }
      },
    );
  }//updateWidget
  
}
//change city class
class ChageCity extends StatelessWidget {

  final _cityFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Change City"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset(
              'images/image1.jpg', 
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          new ListView(
            children: <Widget>[
              new ListTile(
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Enter City"
                  ),
                  controller: _cityFieldController,
                  keyboardType: TextInputType.text,
                ),
              ),
              new ListTile(
                title: new FlatButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      "city": _cityFieldController.text
                    });
                  },
                  child: new Text(
                    "Get Weather",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,             
                    ),
                  ),
                  color: Colors.redAccent,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

//text style
TextStyle cityStyle() {
  return new TextStyle(
    color: Colors.white,
    fontSize: 30.0,
  );
}