import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_bot_app/screen/weather/loadData.dart';
import 'package:flutter_chat_bot_app/screen/weather/weather.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  final List<Map<String, String>> locations = [
    {"name": "Bangkok", "lat": "13.736717", "lon": "100.5231865"},
    {"name": "Ubon Ratchathani", "lat": "15.244375", "lon": "104.84766"},
    {"name": "Phuket", "lat": "7.878978", "lon": "98.398392"},
    {"name": "Nonthaburi", "lat": "13.859108", "lon": "100.52165"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0, //เงา
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          String? name = locations[index]['name'];
          String? lat = locations[index]['lat'];
          String? lon = locations[index]['lon'];

          return Column(
            children: [
              ListTile(
                title: Text(name ?? "", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('lat: $lat long: $lon'),
                onTap: () async {
                  if(lat != null && lon != null) {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => Weatherscreen(lat: lat, long: lon)
                      )
                    );
                  }
                },
              ),
              Divider(
                height: 1,
                color: Colors.grey[800],
              )
            ],
          );
        },
      ),
    );
  }
}
