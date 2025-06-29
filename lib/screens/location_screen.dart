import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: (){},
                      child: Icon(
                          Icons.near_me
                      )
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    child: Icon(
                        Icons.location_city
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Text(
                        '32°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        '☀️',
                        style: kConditionTextStyle,
                      ),
                    ],
                  )
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "It's 🍦 time in San Francisco!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          )
      )

    );
  }
}
