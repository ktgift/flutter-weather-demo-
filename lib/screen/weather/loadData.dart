import 'package:flutter_chat_bot_app/services/weather.dart';

class LoadData {
  Map<dynamic, dynamic> resData = {};

  Future<void> setupWeather({String? lati, String? long}) async {
    String latitude = lati ?? "13.736717";
    String longitude = long ?? "100.5231865";

    Weather dataBKK = Weather(lat: latitude, lon: longitude);
    await dataBKK.fetchDataWeather();
    // print('dataBKK ${dataBKK.data}');

    if (dataBKK.data != null) {
      var tranData = {
        'name': dataBKK.data['location']['name'],
        'temp_c': dataBKK.data['current']['temp_c'],
        'temp_f': dataBKK.data['current']['temp_f'],
        'last_updated': dataBKK.data['current']['last_updated'],
        'icon': dataBKK.data['current']['condition']['icon'],
        'status': dataBKK.data['current']['condition']['text'],
        'wind_mph': dataBKK.data['current']['wind_mph'],
        'wind_kph': dataBKK.data['current']['wind_kph'],
        'wind_degree': dataBKK.data['current']['wind_degree'],
        'wind_dir': dataBKK.data['current']['wind_dir'],
      };
      resData = tranData;
    }
  }
}