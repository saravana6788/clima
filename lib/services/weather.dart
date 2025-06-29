import 'location.dart';
import 'netwroking.dart';

class WeatherModel {

  Future<dynamic> getLocation() async{
    Location location = Location();
    await location.getCurrentLocation();
    print("lat = ${location.latitude} long = ${location.longitude}");
    NetworkHelper networkHelper = NetworkHelper();
    var weatherData =  await networkHelper.getWeatherData(location.latitude,location.longitude);
    return weatherData;

  }

  Future<dynamic> getWeatherByCity(dynamic city) async{
    NetworkHelper networkHelper = NetworkHelper();
    var weatherData = await networkHelper.getWeatherDataByCity(city);
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '☀️';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
