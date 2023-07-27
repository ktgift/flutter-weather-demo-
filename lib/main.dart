import 'package:flutter/material.dart';
import 'package:flutter_chat_bot_app/screen/chat.dart';
import 'package:flutter_chat_bot_app/screen/weather/choose_location.dart';
import 'package:flutter_chat_bot_app/screen/weather/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/chat':(context) => Chatscreen(),
        '/weather':(context) => Weatherscreen(),
        '/location':(context) => ChooseLocation()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold( 
        body: TabBarView(
          children: [
            Chatscreen(),
            Weatherscreen()
          ]
        ),
        backgroundColor: Colors.indigo,
        bottomNavigationBar: TabBar(
          tabs: [
          Tab(text: 'chat',),
          Tab(text: 'weather',)
        ],
        ),
      )
    );
  }
}
