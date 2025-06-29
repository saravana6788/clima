import 'dart:async';

import 'package:geolocator/geolocator.dart';

class Location{
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async{
    try{
      GeolocatorPlatform geoLocator = GeolocatorPlatform.instance;
      Position position = await Geolocator.getCurrentPosition(
         /* locationSettings: LocationSettings(
              accuracy: LocationAccuracy.low
          )*/
      );

      latitude = position.latitude;
      longitude = position.longitude;

    }catch(e){
      print(e);
      latitude = 0.0;
      longitude = 0.0;
    }

  }




}