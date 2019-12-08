import 'package:flutter/material.dart';
import 'package:virtualeye/components/bottombar.dart';

class HomeUI extends StatefulWidget{
  @override
  HomeBody createState() => HomeBody();
}

class HomeBody extends State<HomeUI>{
  int currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: SafeArea(
        child: Container(

          padding: EdgeInsets.all(20),
          child: Column(
            //TODO: Add Sliders
          ),
        ),
      ),
      bottomNavigationBar: BaseBottomBar()
    );
  }
}