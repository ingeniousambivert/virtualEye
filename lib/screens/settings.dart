import 'package:flutter/material.dart';
// For better logging
/// Use standard android logging methods.
import 'package:logger/logger.dart';

// For using the BaseAppBar and BaseBottomBar
import 'package:virtualeye/components/appbar.dart';
import 'package:virtualeye/components/bottombar.dart';

final log = Logger(
    printer: PrettyPrinter(
  methodCount: 0,
  errorMethodCount: 5,
  lineLength: 50,
  colors: true,
  printEmojis: true,
  printTime: false,
));

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(),
        body: SettingsUI(),
        bottomNavigationBar: BaseBottomBar());
  }
}

class SettingsUI extends StatefulWidget {
  @override
  SettingsBody createState() => SettingsBody();
}

class SettingsBody extends State<SettingsUI> {
  int currentIndex = 0;

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
    ));
  }
}
