import 'package:flutter/material.dart';
// For better logging
/// Use standard android logging methods.
import 'package:logger/logger.dart';

// Importing all the components
import 'package:virtualeye/screens/home.dart';
import 'package:virtualeye/screens/settings.dart';
import 'package:virtualeye/screens/map.dart';
import 'package:virtualeye/screens/about.dart';

final log = Logger(
    printer: PrettyPrinter(
  methodCount: 0,
  errorMethodCount: 5,
  lineLength: 50,
  colors: true,
  printEmojis: true,
  printTime: false,
));

class BaseBottomBar extends StatefulWidget {
  @override
  _BaseBottomBarState createState() => _BaseBottomBarState();
}

class _BaseBottomBarState extends State<BaseBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      //shape: CircularNotchedRectangle(),
      child: Container(
        height: 75,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.all(30.0),
              icon: Icon(Icons.home),
              tooltip: "Home",
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.all(30.0),
              icon: Icon(Icons.directions),
              tooltip: "Directions",
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => Map(),
                  ),
                );
              },
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.all(30.0),
              icon: Icon(Icons.help),
              tooltip: "About",
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => About(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
