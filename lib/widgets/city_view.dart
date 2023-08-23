import 'package:flutter/material.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';
import 'package:weather_example/utilities/forecast_util.dart';

// Отображение города, даты

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const CityView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    // обращаемся к API
    var city = snapshot.data!.city.name;
    var country = snapshot.data!.city.country;
    //? получаем дату из JSON
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt * 1000);
    return Container(
      child: Column(
        children: [
          Text(
            '$city, $country',
            style: const TextStyle( 
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
              color: Colors.brown,
            ),
          ),
          Text(
            '${Util.getFormattedData(formattedDate)}',
            style: const TextStyle(
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
