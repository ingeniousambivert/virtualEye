import 'package:flutter/material.dart';
import 'package:virtualeye/components/appbar.dart';
import 'package:virtualeye/components/bottombar.dart';

class Home extends StatelessWidget{
@override
Widget build(BuildContext context) {
  return Scaffold(

    appBar:BaseAppBar(),
    body: HomeUI(),
      bottomNavigationBar: BaseBottomBar()
  );
}

}

class HomeUI extends StatefulWidget{
  @override
  HomeBody createState() => HomeBody();
}

class HomeBody extends State<HomeUI>{
  int currentIndex = 0 ;

  double _value = 0.0;
  void _setvalue(double value) => setState(() => _value = value);
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Text('Intensity: ${(_value * 100).round()}'),
                  new Slider(value: _value, onChanged: _setvalue)
                ],
              ),
            ),
        ),
      )
    );
  }
}