import 'package:flutter/material.dart';
import 'package:virtualeye/screens/home.dart';
import 'package:virtualeye/screens/settings.dart';
import 'package:virtualeye/screens/map.dart';
import 'package:virtualeye/screens/about.dart';


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
              padding: EdgeInsets.all( 25.0),
              icon: Icon(Icons.home),
              tooltip: "Home",
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => BluetoothApp(),
                  ),
                );
              },
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.all( 25.0),
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
              padding: EdgeInsets.all( 25.0),
              icon: Icon(Icons.settings),
              tooltip: "Setting",
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => Settings(),
                  ),
                );
              },
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.all( 25.0),
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
