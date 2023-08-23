import 'package:flutter/material.dart';
import 'package:weather_example/api/weather_api.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_example/screens/city_screen.dart';
import 'package:weather_example/widgets/bottum_list_view.dart';
import 'package:weather_example/widgets/city_view.dart';
import 'package:weather_example/widgets/detail_view.dart';
import 'package:weather_example/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  //! реализуем конструктор для получения погоды по локации  
  final locationWeather;
  WeatherForecastScreen({this.locationWeather});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

 class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  // String _cityName = 'London'; //1

  late String _cityName;

  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }
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
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
          
        ),
        actions: [
          IconButton(
            onPressed: () async {
              var tappedName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return CityScreen();
              }));
              if (tappedName != null) {
                setState(() {
                  _cityName = tappedName;
                  forecastObject = WeatherApi()
                      .fetchWeatherForecast(city: _cityName, isCity: true);
                });
              }
            },
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
                    const SizedBox(height: 50.0),
                    // вызываем созданный нами виджет DetailView
                    DetailView(snapshot: snapshot),
                    const SizedBox(height: 50.0),
                    // вызываем созданный нами виджет BottumListView
                    BottumListView(snapshot: snapshot)
                  ],
                );
              } else {
                return Center(
                  child: Text(
                      'City not found\nPlease, enter correct city',
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
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
