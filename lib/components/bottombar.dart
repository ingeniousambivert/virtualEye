import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:virtualeye/screens/home.dart';
import 'package:virtualeye/screens/map.dart';
import 'package:virtualeye/screens/about.dart';

class BaseBottomBar extends StatefulWidget {
  @override
  _BaseBottomBarState createState() => _BaseBottomBarState();
}

class _BaseBottomBarState extends State<BaseBottomBar> {
  _BaseBottomBarState({this.position, this.currentIndex = 0});

  int currentIndex;
  Position position;

  void getLocation() async {
    Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
              tooltip: "Home",
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
                setState(() {
                  currentIndex = 0;
                  print(currentIndex);
                });
              },
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.only(right: 28.0),
              icon: Icon(Icons.directions),
              tooltip: "Directions",
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => Map(),
                  ),
                );
                setState(() {
                  currentIndex = 1;
                  print(currentIndex);
                });
              },
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.only(left: 28.0),
              icon: Icon(Icons.notifications),
              tooltip: "Notifications",
              onPressed: () {
                setState(() {
                  currentIndex = 2;
                  print(currentIndex);
                });
              },
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.only(right: 28.0),
              icon: Icon(Icons.help),
              tooltip: "About",
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => About(),
                  ),
                );
                setState(() {
                  currentIndex = 3;
                  print(currentIndex);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
