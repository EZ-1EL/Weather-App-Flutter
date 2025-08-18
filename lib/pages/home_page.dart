import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    List<Color> colors = [Color(0xff955cd1), Color(0xff3fa2fa)];

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: weatherData == null
          ? Container(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.76,
                    width: size.width,
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
                          padding: const EdgeInsets.only(top: 20, left: 340),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (contex) {
                                  return SearchPage(
                                    updateUi: updateUi,
                                  );
                                }));
                              },
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 90),
                          child: Text(
                            'Not found...',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontFamily: 'MavenPro',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/rain.png',
                                height: 100,
                                width: 100,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Text(
                    'Aasem',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: 'MavenPro',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : Container(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.76,
                    width: size.width,
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
                          padding: const EdgeInsets.only(top: 20, left: 340),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (contex) {
                                  return SearchPage(
                                    updateUi: updateUi,
                                  );
                                }));
                              },
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                        ),
                        Text(
                          'Weather',
                          style: TextStyle(
                              fontSize: 50,
                              color: Color(0xffffffff),
                              fontFamily: 'MavenPro'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 90),
                          child: Text(
                            Provider.of<WeatherProvider>(context).cityName ??
                                '',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontFamily: 'MavenPro',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                          // 'Updated at :${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',

                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'MavenPro'),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                weatherData!.getimg(),
                                height: 100,
                                width: 100,
                              ),
                              Text(
                                '${weatherData!.temp.toInt()}',
                                style: TextStyle(
                                    fontSize: 55, color: Colors.white),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'maxTemp: ${weatherData!.maxTemp.toInt()}',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Text(
                                    'minTemp: ${weatherData!.minTemp.toInt()}',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            weatherData!.weatherStateName,
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontFamily: 'MavenPro',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
