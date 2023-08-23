import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    cursorColor: Colors.blueGrey[800],
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Enter City Name',
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.brown[500],
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      icon: const Icon(
                        Icons.location_city,
                        color: Colors.brown,
                      ),
                    ),
                    //! реализуем отработку написанного
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
              ),
              TextButton(
                  child: const Text(
                    'Get Weather',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
