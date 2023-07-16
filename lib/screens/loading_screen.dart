import 'package:clima/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();
  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    Location location = Location();
    await location.determinePosition();
  }

  void getWeatherData() async {
    // String url = "https://api.openweathermap.org/data/2.5/weather?lat="+location.latitude+"&lon="location.longitude"&appid=dba68107515a4901722d3c3cd51fb5bb";

    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=dba68107515a4901722d3c3cd51fb5bb'));

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getWeatherData();
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
