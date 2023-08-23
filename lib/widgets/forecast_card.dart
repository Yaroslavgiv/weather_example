// Виджет карточки прогнозов на неделю
import 'package:flutter/material.dart';
import 'package:weather_example/utilities/forecast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data.list;
  // День недели
  var dayOfWeek = '';
  // получаем день недели в нужном формате
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedData(date);
  dayOfWeek = fullDate.split(',')[0]; // Tue
  var icon = forecastList[index].getIconUrl();
  var tempMin = forecastList[index].temp.min.toStringAsFixed(0);

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dayOfWeek,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$tempMin °C',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Image.network(
                    icon,
                    scale: 1.2,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
