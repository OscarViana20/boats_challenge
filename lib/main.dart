import 'package:boats_challenge/src/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Boats challenge',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage()
      },
    );
  }
}
