import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:virtualeye/screens/map.dart';

 class BaseBottomBar extends StatefulWidget  {
  @override
  _BaseBottomBarState createState() => _BaseBottomBarState();
}

class _BaseBottomBarState extends State<BaseBottomBar> {

  _BaseBottomBarState({this.lat,this.long,this.position,this.currentIndex = 0});

  int currentIndex ;
  Position position;
  final double lat;
  final double long;

  void getLocation () async {
  Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
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
                  setState(() {
                    currentIndex = 0;
                  });
                  Navigator.pushNamed(context, '/home');
                },
              ),

              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.directions),
                tooltip: "Directions",
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Map(lat:23.0271,
                          long:72.5515),
                    ),
                  );
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

                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.help),
                tooltip: "About",
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                    Navigator.pushNamed(context, '/about');
                  });
                },
              )
            ],
          ),
        ),
      );
  }

  //Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
