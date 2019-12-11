import 'package:flutter/material.dart';
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

class BaseAppBar extends StatelessWidget with PreferredSizeWidget {
  final Color backgroundColor = Colors.red;
  final Text title;
  final AppBar appBar;
  final List<Widget> widgets;

  BaseAppBar({Key key, this.title, this.appBar, this.widgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "virtualEye",
          style: TextStyle(color: Colors.white),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
