import 'package:flutter/material.dart';
import 'package:localeventsapp/Screens/Welcome/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tulink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF1E6FF),
        primaryColor: Color(0xFF6F35A5),
      ),
      home: WelcomeScreen(),
    );
  }
}