import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({super.key, this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Color(0xff955cd1), Color(0xff3fa2fa)];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: size.height * 0.76,
                width: size.width,
                padding: EdgeInsets.only(top: 30),
                margin: EdgeInsets.only(right: 10, left: 10),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                      colors: colors,
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.2, 0.85],
                    )),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 150),
                      child: Text(
                        'Weatherapp',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontFamily: 'MavenPro'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(),
                      child: Container(
                          child: Image.asset('assets/images/weather.png',
                              height: 320, width: 320)),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        onChanged: (data) {
                          cityName = data;
                        },
                        onSubmitted: (data) async {
                          cityName = data;
                          WeatherServices services = WeatherServices();
                          var currentContext =
                              context; // Store the current BuildContext
                          try {
                            WeatherModel? weather =
                                await services.getWeather(cityName: cityName!);
                            Provider.of<WeatherProvider>(currentContext,
                                    listen: false)
                                .weatherData = weather;
                            Provider.of<WeatherProvider>(currentContext,
                                    listen: false)
                                .cityName = cityName;
                            Navigator.pop(currentContext);
                          } catch (e) {
                            if (kDebugMode) {
                              print('Error: $e');
                            }
                            // Handle the error
                          }
                        },
                        decoration: InputDecoration(
                          suffixIconColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 32, horizontal: 24),
                          label: Text(
                            'Search',
                            style: TextStyle(color: Colors.white),
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () async {
                                WeatherServices services = WeatherServices();
                                WeatherModel? weather = await services
                                    .getWeather(cityName: cityName!);
                                Provider.of<WeatherProvider>(context,
                                        listen: false)
                                    .weatherData = weather;
                                Provider.of<WeatherProvider>(context,
                                        listen: false)
                                    .cityName = cityName;
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.search_rounded)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: 'Enter the City',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
