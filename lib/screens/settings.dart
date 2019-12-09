import 'package:flutter/material.dart';
import 'package:virtualeye/components/appbar.dart';
import 'package:virtualeye/components/bottombar.dart';

class Settings extends StatelessWidget{
@override
Widget build(BuildContext context) {
  return Scaffold(

    appBar:BaseAppBar(),
    body: SettingsUI(),
      bottomNavigationBar: BaseBottomBar()
  );
}

}

class SettingsUI extends StatefulWidget{
  @override
  SettingsBody createState() => SettingsBody();
}

class SettingsBody extends State<SettingsUI>{
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