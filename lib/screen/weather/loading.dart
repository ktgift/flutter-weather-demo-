import 'package:flutter/material.dart';
import 'package:flutter_chat_bot_app/services/weather.dart';
import 'dart:convert';
import 'package:http/http.dart' as http ;

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  dynamic weatherBKK;
  dynamic weatherNMA;
  dynamic resData;

  // Future<dynamic> fetchData({String? lat, String? lon}) async {
  //   var url = 'https://weatherapi-com.p.rapidapi.com/current.json?q=$lat%2C$lon';
  //   var headers = {
  //     'X-RapidAPI-Key': '8d9c2ae8a0msh39dd05d73a46878p15942ajsn95ded3cc4705',
  //     'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com',
  //   };
  //   try {
  //     var res = await http.get(Uri.parse(url), headers: headers);
  //     if(res.statusCode == 200) {
  //       Map data = jsonDecode(res.body);
  //       return data;
  //     }
  //   } catch (err) {
  //     print('err $err');
  //   }
  //   return null; // Don't forget to return a value in case of an error
  // }

  void setupWeather() async {
    Weather dataBKK = Weather(lat: "13.74", lon: "100.523186");
    await dataBKK.fetchDataWeather();
    // print('dataBKK ${dataBKK.data}');
    setState(() {
      weatherBKK = dataBKK.data;
    });
    // Weather dataBKK = Weather(lat: "13.74", lon: "100.523186");
    // await dataBKK.fetchDataWeather();
    // print('dataBKK ${dataBKK.data}');
    // setState(() {
    //   weatherBKK = dataBKK.data;
    // });

    // Weather dataNMA = Weather(lat: "14.979900", lon: "102.097771");
    // await dataNMA.fetchDataWeather();
    // print('dataNMA ${dataNMA.data}');
    // setState(() {
    //   weatherNMA = dataNMA.data;
    // });
    
    if(dataBKK.data != null) {
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

      // Navigator.pushReplacementNamed(context, '/weather', arguments: tranData);
      setState(() {
        resData = tranData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setupWeather();
    // _fetchWeatherData();
  }

  // Future<void> _fetchWeatherData() async {
  //   try {
  //     var dataBKK = await fetchData(lat: "13.74", lon: "100.523186");
  //     var dataNMA = await fetchData(lat: "14.979900", lon: "102.097771");

  //     setState(() {
  //       weatherBKK = dataBKK;
  //       weatherNMA = dataNMA;
  //     });
  //   } catch(err) {
  //     print('Error while fetching weather data: $err');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(children: [
          Text('loading'),
        ]),
      ),
    );
  }
}