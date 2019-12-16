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

class About extends StatefulWidget {
  @override
  _InfoService createState() => _InfoService();
}

class _InfoService extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          'About',
          style: TextStyle(color: Colors.white),
        ),
        appBar: AppBar(),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Guide for virtualEye :",
                  style: TextStyle(fontSize: 30.0),
                ),
              )),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              Center(
                child: FlatButton(
                    color: Colors.black87,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.grey,
                    child: Text('Learn More'),
                    onPressed: () {
                      log.i('Learn More Button Pressed');
                    }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BaseBottomBar(),
    );
  }
}
