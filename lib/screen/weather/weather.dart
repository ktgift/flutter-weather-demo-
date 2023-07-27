import 'package:flutter/material.dart';
import 'package:flutter_chat_bot_app/screen/weather/loadData.dart';
import 'package:flutter_chat_bot_app/screen/weather/loading.dart';
import 'dart:ui';
import 'package:intl/intl.dart';

class Weatherscreen extends StatefulWidget {
  final String? lat;
  final String? long;

  Weatherscreen({super.key,  this.lat,  this.long});

  @override
  State<Weatherscreen> createState() => _WeatherscreenState();
}

class _WeatherscreenState extends State<Weatherscreen> {
  Map<dynamic, dynamic>? data = {}; //ประกาศ data เป็น map

  final loadDataweather = LoadData();

  @override
  Widget build(BuildContext context) {
    TextStyle header1 = const TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold);
    TextStyle header2 = const TextStyle(color: Colors.white, fontSize: 22);
    TextStyle text = const TextStyle(color: Colors.white, fontSize: 16);

    return Scaffold(
      appBar: AppBar(title: Text('Weather Today')),
      body: FutureBuilder(
        future: loadDataweather.setupWeather(lati: widget.lat, long: widget.long), // Call setupWeather() here
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            data = loadDataweather.resData;
            return Container(
              width:
                  double.infinity, // Set the width to full width of the display
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter, // Starting point of the gradient
                  end: Alignment.bottomCenter, // Ending point of the gradient
                  colors: [Colors.indigo, Colors.blue],
                  stops: [ 0.0,0.7 ], //ใส่ค่า double เพื่อกำหนดจุดหยุดสำหรับแต่ละสีในเกรเดียนต์ ค่าที่กำหนดควรอยู่ในช่วง 0.0 ถึง 1.0 ถ้าไม่กำหนดจุดหยุด สีจะถูกกระจายอย่างสม่ำเสมอ
                  tileMode: TileMode.repeated, //แสดงซ้ำจนเต็มพื้นที่
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data?['name'] ?? '',
                      style: header1,
                    ),
                    Image.network('https:${data?['icon']}',
                        width: 64, height: 64),
                    Text('${data?['temp_c'].toString() ?? ''}\u00B0',
                        style: const TextStyle(fontSize: 60, color: Colors.white)),
                    Text(
                      data?['status'],
                      style: header2,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[700]?.withAlpha(150),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                      child: Text(
                        'ความเร็วลมคือ ${data?['wind_mph']} ไมล์ต่อชั่วโมง หรือ ${data?['wind_kph']} กิโลเมตรต่อชั่วโมง ลมพัดมาจากทิศ ${data?['wind_dir']} และทิศทางลมประมาณ ${data?['wind_degree']} องศา',
                        style: text,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Updated: ${data?['last_updated']}',
                      style: text,
                    )
                  ]),
            );
          }
        },
      ),
      floatingActionButton: TextButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, '/location');
        },
        icon: const Icon(Icons.cloud),
        label: const Text('Edit Location'),
        style: const ButtonStyle(
          foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
        ),
      ),
    );
  }
}
