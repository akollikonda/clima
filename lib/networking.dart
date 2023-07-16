import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getWeatherData() async {
    http.Response response = await http.get(Uri.parse(url));
    var decodeData;
    if (response.statusCode == 200) {
      String data = response.body;
      decodeData = jsonDecode(data);
    } else {
      print(response.statusCode);
    }

    return decodeData;
  }
}
