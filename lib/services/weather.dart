import 'dart:convert';
import 'package:http/http.dart' as http;

class Weather {
  String lat;
  String lon;
  dynamic data;

  Weather({required this.lat, required this.lon});

  Future<void> fetchDataWeather() async {
    var url = 'https://weatherapi-com.p.rapidapi.com/current.json?q=$lat%2C$lon';
    var headers = {
      'X-RapidAPI-Key': '8d9c2ae8a0msh39dd05d73a46878p15942ajsn95ded3cc4705',
      'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com',
    };
    try {
      var res = await http.get(Uri.parse(url), headers: headers);
      if (res.statusCode == 200) {
        Map dataRes = jsonDecode(res.body);
        data = dataRes;
        // print(dataRes);
      }
    } catch (err) {
      print('err $err');
    }
  }
}
