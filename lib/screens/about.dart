import 'package:flutter/material.dart';
import 'package:virtualeye/components/appbar.dart';
import 'package:virtualeye/components/bottombar.dart';

class About extends StatefulWidget{
  @override
  _InfoService createState() => _InfoService();
}

class _InfoService extends State<About>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("How to use Virtual Eye app :",style: TextStyle(fontSize: 20.0),),

              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: Text("Under construction"),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BaseBottomBar() ,
    );
  }

}
