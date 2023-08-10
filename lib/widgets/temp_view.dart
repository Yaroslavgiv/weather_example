// Виджет отображения температуры

import 'package:flutter/material.dart';

import 'package:weather_example/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const TempView({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var icon = forecastList?[0].getIconUrl();
    var temp = forecastList?[0].temp.day.toStringAsFixed(0);
    var description = forecastList?[0].weather[0].description.toUpperCase();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            icon!,
            color: Colors.brown,
            scale: 0.4,
          ),
          const SizedBox(width: 20.0),
          Column(
            children: [
              Text(
                '$temp °C',
                style: const TextStyle(
                  fontSize: 54,
                  color: Colors.brown,
                ),
              ),
              Text('$description', style: TextStyle(fontSize: 18, color: Colors.brown[500]),)
            ],
          ),
        ],
      ),
    );
  }
}
