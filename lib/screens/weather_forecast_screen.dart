import 'package:flutter/material.dart';
import 'package:weather_example/api/weather_api.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_example/widgets/city_view.dart';
import 'package:weather_example/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();
    forecastObject =
        WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);

    //? что небудь выведим
  //   forecastObject.then((weather) {
  //     print(weather.list![0].weather[0].main);
  //   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('openweathermap.org'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.my_location),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.location_city),
          )
        ],
      ),
      body: ListView(children: [
        Container(
          child: FutureBuilder<WeatherForecast>(
            future: forecastObject,
            builder: (context, snapshot) {
              //? если мы получили данные
              if (snapshot.hasData) {
                return Column(
                  //? подключаем CityView
                  children: [
                    const SizedBox(height: 50.0),
                    // вызываем созданный нами виджет CityView
                    CityView(snapshot: snapshot),
                    // вызываем созданный нами виджет TempView
                    const SizedBox(height: 50.0),
                    TempView(snapshot: snapshot),

                  ],  
                );
              } else {
                return const Center(
                  child: SpinKitDoubleBounce(
                    color: Colors.brown,
                    size: 100.0,
                  ),
                );
              }
            },
          ),
        )
      ]),
    );
  }
}
