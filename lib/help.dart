import 'package:flutter/material.dart';

class Help extends StatefulWidget{
  @override
  _InfoService createState() => _InfoService();
}

class _InfoService extends State<Help>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text("How to use Virtual Eye app :",style: TextStyle(fontSize: 20.0),),
              
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: Text("Hello World "),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

}