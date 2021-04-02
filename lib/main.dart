import 'package:flutter/material.dart';

import 'ui/homepage/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF1E6FF),
        primaryColor: Color(0xFF6F35A5),
      ),
      home: HomePage(),
    );
  }
}