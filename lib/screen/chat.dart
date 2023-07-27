import 'package:flutter/material.dart';
import 'package:flutter_chat_bot_app/utils/Textfield_radius50.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({super.key});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat bot"),
      ),
      body: Container(),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Textfield_radius50(
                  labelText: "Enter text",
                  textAlign: TextAlign.end,
                  textInputAction: TextInputAction.next,
                )),
            Expanded(
                flex: 0,
                child: IconButton(
                  icon: Icon(Icons.send_rounded),
                  color: Colors.blueAccent,
                  iconSize: 30,
                  onPressed: () => {},
                ))
          ],
        ),
      )),
    );
  }
}