import 'package:flutter/material.dart';
// For better logging
/// Use standard android logging methods.
import 'package:logger/logger.dart';

// Importing all the components

// Screens
import 'package:virtualeye/screens/home.dart';
import 'package:virtualeye/screens/map.dart';
import 'package:virtualeye/screens/about.dart';
import 'package:virtualeye/screens/mlhome.dart';

// Services
import 'package:virtualeye/services/camera_preview_scanner.dart';
import 'package:virtualeye/services/material_barcode_scanner.dart';
import 'package:virtualeye/services/picture_scanner.dart';

final log = Logger(
    printer: PrettyPrinter(
  methodCount: 0,
  errorMethodCount: 5,
  lineLength: 50,
  colors: true,
  printEmojis: true,
  printTime: false,
));

void main() => runApp(virtualEye());

// ignore: camel_case_types
class virtualEye extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Initial route set to home screen.
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/about': (context) => About(),
        '/map': (context) => Map(),
        '/mlhome': (context) => MLVisionList(),
        '/camera_preview_scanner': (context) => CameraPreviewScanner(),
        '/material_barcode_scanner': (context) => MaterialBarcodeScanner(),
        '/picture_scanner': (context) => PictureScanner(),
      },
      // To disable the debug banner on the app
      debugShowCheckedModeBanner: false,
    );
  }
}
