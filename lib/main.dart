import 'package:flutter/material.dart';
import 'package:virtualeye/screens/settings.dart';
import 'package:virtualeye/screens/about.dart';
import 'package:virtualeye/screens/map.dart';
import 'package:virtualeye/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BluetoothApp(),
      //initialRoute: '/',
      //routes: {
       // '/':(BuildContext context) => BluetoothApp(),
        //'/home':(BuildContext context)=>Home(),
        //'/map':(BuildContext context) => Map(),
        //'/about':(BuildContext context) => About(),
      //},
      debugShowCheckedModeBanner: false,
    );
  }
}


