import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Map extends StatefulWidget{
  @override
  _MapActivity createState() => _MapActivity();
}

class _MapActivity extends State<Map>{

   double lat;
   double long;

  GoogleMapController mapController;

  void getCurrentLocation() async{
    Position position = await Geolocator().getLastKnownPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
    print(position);
    lat = position.latitude;
    long = position.longitude;
  }
  void _onMapCreated(GoogleMapController controller) {
    getCurrentLocation();
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Stack(
            children: <Widget>[
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(23.0271, 72.5515),
                 // target: LatLng(lat, long),
                  zoom: 15.0,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:50.0,right:30.0,left:30.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      autofocus: false,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: new EdgeInsets.fromLTRB(
                              10.0, 30.0, 10.0, 10.0),
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Colors.black)
                          ),
                          hoverColor: Colors.black,
                          hintText: "Enter Directions",
                          prefixIcon: Icon(Icons.map,color: Colors.black,),
                          suffixIcon: Icon(Icons.history,color:Colors.black)
                      ),
                    ),


                  ],
                ),
              ),


            ],
          ),
        ),

        floatingActionButton: Container(

          height: 65.0,
          width: 65.0,

          child: FittedBox(
            child: FloatingActionButton(
              onPressed: (){
                Navigator.pop(context);
              },
              backgroundColor: Colors.black,
              child: Icon(Icons.arrow_left, color: Colors.white,),
              tooltip: "Back To Home",
            ),
          ),
        ),
      ),
    );
  }
}