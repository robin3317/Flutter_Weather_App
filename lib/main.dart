import 'package:flutter/material.dart';
import './ui/weather.dart';

void main() {
  runApp(
    new MaterialApp(
      title: "Weather Update",
      home: new WeatherUpdate(),
      debugShowCheckedModeBanner: false,
    )
  );
}