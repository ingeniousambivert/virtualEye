import 'package:flutter/material.dart';
import 'package:virtualeye/components/appbar.dart';
import 'package:virtualeye/screens/home.dart';
import 'package:virtualeye/screens/about.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => Home(),
       // '/map':(context) => Map(),
        '/about':(context) => About(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:BaseAppBar(),
      body: HomeUI(),
    );
  }

}
