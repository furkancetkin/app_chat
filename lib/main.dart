import 'package:app_chat/chat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sohbet Uygulaması"),
        ),
        body: SafeArea(child: Chat()),
      ),
    );
  }
}
