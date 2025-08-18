import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    String localtimeString = data['location']['localtime'];
    DateTime? date = DateFormat("yyyy-MM-dd HH:mm").parse(localtimeString);

    if (date == null) {
      throw FormatException("Invalid date format: $localtimeString");
    }

    return WeatherModel(
      date: date,
      temp: jsonData['avgtemp_c'],
      minTemp: jsonData['mintemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      weatherStateName: jsonData['condition']['text'],
    );
  }
  @override
  String toString() {
    return 'temp=$temp minTemp=$minTemp';
  }

  String getimg() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Party cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Moderate rain') {
      return 'assets/images/rain.png';
    } else if (weatherStateName == 'Thunderstorm') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  Color getThemData() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Color(0xff955cd1);
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Color(0xff955cd1);
    } else if (weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Party cloudy') {
      return Color(0xff955cd1);
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Moderate rain') {
      return Color(0xff955cd1);
    } else if (weatherStateName == 'Thunderstorm') {
      return Color(0xff955cd1);
    } else {
      return Color(0xff955cd1);
    }
  }
}
