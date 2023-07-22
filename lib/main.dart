import 'package:flutter/material.dart';
import 'package:weather_example/screens/weather_forecast_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherForecastScreen(),
    );
  }
}
