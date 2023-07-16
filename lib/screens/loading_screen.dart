import 'package:clima/location.dart';
import 'package:clima/networking.dart';
import 'package:flutter/material.dart';

const apiKey = 'dba68107515a4901722d3c3cd51fb5bb';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherData();
  }

  void getWeatherData() async {
    Location location = Location();
    await location.determinePosition();
    latitude = location.latitude;
    longitude = location.longitude;
    String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey";

    NetworkHelper network = NetworkHelper(url);

    var decodeData = await network.getWeatherData();
    var temparature = decodeData['main']['temp'];
    int condition = decodeData['weather'][0]['id'];
    String name = decodeData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Get Location'),
          onPressed: () {
            // _determinePosition();
          },
        ),
      ),
    );
  }
}
