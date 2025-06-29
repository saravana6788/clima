import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../services/location.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }
  void getLocation() async{
    Location location = Location();
    await location.getCurrentLocation();
    print("lat = ${location.latitude} long = ${location.longitude}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              getLocation();
            },
            child: Text(
              "Get Location"
            )
        )
      ),
    );
  }
}
