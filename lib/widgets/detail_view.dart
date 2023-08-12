import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/weather_forecast_daily.dart';
import '../utilities/forecast_util.dart';

// отображение силы ветра, давления и осадков
class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const DetailView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var pressure = forecastList![0].pressure * 0.750062;
    var humidity = forecastList[0].humidity;
    var wind = forecastList[0].speed;
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // реализуем подгрузку давления
          Util.getTtem(FontAwesomeIcons.temperatureThreeQuarters,
              pressure.round(), 'mm Hg'),
          Util.getTtem(FontAwesomeIcons.cloudRain, humidity, '%'),
          Util.getTtem(FontAwesomeIcons.wind, wind.toInt(), 'm/s'),
        ],
      ),
    );
  }
}
