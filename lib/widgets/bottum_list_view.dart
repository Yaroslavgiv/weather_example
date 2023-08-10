import 'package:flutter/material.dart';

import '../models/weather_forecast_daily.dart';

class BottumListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const BottumListView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '7-Day Weather Forecast'.toUpperCase(),
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.brown,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 140,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            // направление
            scrollDirection: Axis.horizontal,
            // разделитель
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            // размер списка
            itemCount: snapshot.data!.list!.length,
            // содержание каждого элимента
            itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width / 2.7,
              height: 160,
              color: Colors.brown,
              child: const Text('eee'),
            ),
          ),
        ),
      ],
    );
  }
}
