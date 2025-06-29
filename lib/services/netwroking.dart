import 'dart:convert';

import 'package:http/http.dart' as http;

const String API_KEY = "23327e8f1d55be5e30141dd8de8784a0";

class NetworkHelper{
  Future getWeatherData(dynamic lat,dynamic long) async{
    try{
      Uri url = Uri(
          scheme: 'https',
          host:'api.openweathermap.org',
          path:'data/2.5/weather',
          queryParameters: {'lat':lat.toString(), 'lon':long.toString(),'appId':API_KEY,'units':'metric'}
      );
      http.Response response = await http.get(url);

      if(response.statusCode == 200){
        print("response = ${response.body}");
        String data = response.body;
        var decodeData = jsonDecode(data);
        return decodeData;
      }else{
        print("Call Failed");
      }

    }catch(e){
      print(e);
    }
  }

  Future getWeatherDataByCity(dynamic cityName) async{
    try{
      Uri url = Uri(
          scheme: 'https',
          host:'api.openweathermap.org',
          path:'data/2.5/weather',
          queryParameters: {'q':cityName.toString(),'appId':API_KEY,'units':'metric'}
      );
      http.Response response = await http.get(url);

      if(response.statusCode == 200){
        print("response = ${response.body}");
        String data = response.body;
        var decodeData = jsonDecode(data);
        return decodeData;
      }else{
        print("Response Code:${response.statusCode}");
        print("Call Failed");
      }

    }catch(e){
      print(e);
    }
  }
}