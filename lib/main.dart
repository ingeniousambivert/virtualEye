import 'package:flutter/material.dart';
import 'package:seekbar/seekbar.dart';

import 'package:visionui/map.dart';
import 'package:visionui/help.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => FirstScreen(),
        '/map':(context) => Map(),
        '/help':(context) => Help(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Virtual Eye", style: TextStyle(color: Colors.white),),
        actions: <Widget>[
           IconButton(
              icon: Icon(Icons.power_settings_new),
              tooltip: "Power On Off",
              onPressed: () {
              },
            ),
        ],
      ),
      body: MainUi(),
    );
  }

}

class MainUi extends StatefulWidget{
  @override
  _MainBody createState() => _MainBody();
}

class _MainBody extends State<MainUi>{
  int currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: SafeArea(
        child: Container(
  
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              
              //Intensity bar
              Container(
                padding: EdgeInsets.only(top:10,bottom: 10),
                child: Column(
                  children: <Widget>[
                     Text("Intensity : ",style: TextStyle(fontSize: 18),),
              
                      SeekBar(
                        barColor: Colors.grey,
                        progressColor: Colors.black,
                      ),
                  ],
                ),
              ),

              //Distance bar
              Container(
                padding: EdgeInsets.only(top:20,bottom: 10),
                child: Column(
                  children: <Widget>[
                     Text("Distance : ",style: TextStyle(fontSize: 18),),
              
                      SeekBar(
                        barColor: Colors.grey,
                        progressColor: Colors.black,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: Container(
        
        height: 65.0,
        width: 65.0,
        
        child: FittedBox(
          child: FloatingActionButton(
        onPressed: (){

          Navigator.pushNamed(context, '/map');
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.pin_drop, color: Colors.white,),
        tooltip: "Directions",
      ),
        ),
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container( 
          height: 75,
          child: Row( 

        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[
          IconButton(
            iconSize: 30.0,
            padding: EdgeInsets.only(left: 28.0),
            icon: Icon(Icons.home),
            tooltip: "Home Button",
            onPressed: () {
              setState(() {
                currentIndex = 0;
                
              });
            },
          ),

          IconButton(            
            iconSize: 30.0,
            padding: EdgeInsets.only(right: 28.0),
            icon: Icon(Icons.search),
            onPressed: () {
               setState(() {
                currentIndex = 1;
              });
            },
          ),
          IconButton(
            iconSize: 30.0,
            padding: EdgeInsets.only(left: 28.0),
            icon: Icon(Icons.notifications),
            onPressed: () {
               setState(() {
                currentIndex = 2;

              });
            },
          ),
          IconButton(
            iconSize: 30.0,
            padding: EdgeInsets.only(right: 28.0),
            icon: Icon(Icons.help),
            tooltip: "About App",
            onPressed: () {
               setState(() {
                currentIndex = 3;
                Navigator.pushNamed(context, '/help');
              });
            },
          )
        ],
      ),
      ),
      ),
    );
  }
}