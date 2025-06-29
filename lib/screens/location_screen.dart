import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
   LocationScreen({this.weatherData});

   final weatherData;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var weatherModel = WeatherModel();
  var temperature;
  var cityName;
  var condition;
  var message;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var weatherData = widget.weatherData;
    updateUI(weatherData);
  }

  void updateUI(dynamic weatherData){
    setState(() {
      if(weatherData == null){
        temperature = 0;
        condition = 'ERR';
        cityName = '';
        message = 'Error fetching weather';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      condition = weatherModel.getWeatherIcon(weatherData['weather'][0]['id']);
      cityName = weatherData['name'];
      message = weatherModel.getMessage(temperature);
    });

  }

  Future<dynamic> navigateToCityScreen() async{
    var typedCity = await Navigator.push(context, MaterialPageRoute(builder: (context){
      return CityScreen();
    }));
    return typedCity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/location_background.jpg'),
          fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withValues(alpha:0.8), BlendMode.dstATop),
          )
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () async{
                          updateUI(await weatherModel.getLocation());
                        },
                        child: Icon(
                            Icons.near_me,
                          size: 50.0,
                        )
                    ),
                    TextButton(
                      onPressed: () async{
                        var typedCity = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return CityScreen();
                              }
                            )
                        );
                        if(typedCity != null){
                          updateUI(await weatherModel.getWeatherByCity(typedCity));
                        }
                      },
                      child: Icon(
                          Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(
                          '$temperature°',
                          style: kTempTextStyle,
                        ),
                        Text(
                          condition,
                          style: kConditionTextStyle,
                        ),
                      ],
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    "$message in $cityName",
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            )
        ),
      )

    );
  }
}
