import 'package:flutter/material.dart';

 class BaseBottomBar extends StatefulWidget  {
  @override
  _BaseBottomBarState createState() => _BaseBottomBarState();
}

class _BaseBottomBarState extends State<BaseBottomBar> {
  int currentIndex = 0 ;
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
                    Navigator.pushNamed(context, '/');

                  });
                },
              ),

              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.directions),
                tooltip: "Search",
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                    Navigator.pushNamed(context, '/map');
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
