import 'package:flutter/material.dart';
import 'package:virtualeye/screens/home.dart';
import 'package:virtualeye/screens/about.dart';
import 'package:virtualeye/screens/map.dart';
import 'package:virtualeye/screens/connect.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => BluetoothApp(),
        '/home':(context)=>Home(),
        '/map':(context) => Map(),
        '/about':(context) => About(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


