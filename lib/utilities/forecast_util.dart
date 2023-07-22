//? здесь будем форматировать дату прилетевшую с JSON
import 'package:intl/intl.dart';
class Util {
  static String getFormattedData(DateTime dateTime){
    //? берём формат из библиотеки intl (Fry, Iul 07, 2023)
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }
}