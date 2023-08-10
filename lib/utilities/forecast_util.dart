//? здесь будем форматировать дату прилетевшую с JSON
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormattedData(DateTime dateTime) {
    //? берём формат из библиотеки intl (Fry, Iul 07, 2023)
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }
// отображение силы ветра, давления и осадков
  static getTtem(IconData iconData, int value, String units) {
    return Column(
      children: <Widget>[
        Icon(iconData, color: Colors.brown, size: 28.0),
        const SizedBox(height: 10.0),
        Text(
          '$value',
          style: const TextStyle(fontSize: 20.0, color: Colors.brown),
        ),
        const SizedBox(height: 10.0),
        Text(
          '$units',
          style: const TextStyle(fontSize: 15.0, color: Colors.brown),
        ),
      ],
    );
  }
}
