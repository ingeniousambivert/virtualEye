import 'package:flutter/material.dart';
// For better logging
/// Use standard android logging methods.
import 'package:logger/logger.dart';

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
                Navigator.pushNamed(context, '/');
              },
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.all(30.0),
              icon: Icon(Icons.directions),
              tooltip: "Map",
              onPressed: () {
                Navigator.pushNamed(context, '/map');
              },
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.all(30.0),
              icon: Icon(Icons.help),
              tooltip: "About",
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
            )
          ],
        ),
      ),
    );
  }
}
