import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
// For better logging
/// Use standard android logging methods.
import 'package:logger/logger.dart';
import 'package:flutter_knob/flutter_knob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

final log = Logger(
    printer: PrettyPrinter(
  methodCount: 0,
  errorMethodCount: 5,
  lineLength: 50,
  colors: true,
  printEmojis: true,
  printTime: false,
));

class PreferencesPage extends StatefulWidget {
  final BluetoothDevice server;

  const PreferencesPage({this.server});

  @override
  _PreferencesPage createState() => new _PreferencesPage();
}

class _Message {
  int whom;

  String text;

  _Message(this.whom, this.text);
}

class _PreferencesPage extends State<PreferencesPage> {
  static final clientID = 0;
  static final maxMessageLength = 4096 - 3;
  BluetoothConnection connection;

  String onButton = '1,';
  String offButton = '0,';

  double _valueForIntensity = 100.0;
// L+value+,
  void _setValueForIntensity(double value) {
    setState(() => _valueForIntensity = value);
    String valueToSendForIntensity = "L" + _valueForIntensity.toString() + ",";
    _sendMessage(valueToSendForIntensity);
    log.i(_valueForIntensity);
  }

  static const double minValueForIntensity = 100;
  static const double maxValueForIntensity = 255.0;

  double _valueForDistance = 60.0;
// D+value+,
  void _setValueForDistance(double value) {
    setState(() => _valueForDistance = value);
    String valueToSendForDistance = "D" + _valueForDistance.toString() + ",";
    _sendMessage(valueToSendForDistance);
    log.i(_valueForDistance);
  }

  static const double minValueForDistance = 60;
  static const double maxValueForDistance = 500.0;

  bool status = true;
  List<_Message> messages = List<_Message>();
  String _messageBuffer = '';

  final TextEditingController textEditingController =
      new TextEditingController();
  final ScrollController listScrollController = new ScrollController();

  bool isConnecting = true;
  bool get isConnected => connection != null && connection.isConnected;

  bool isDisconnecting = false;

  @override
  void initState() {
    super.initState();

    BluetoothConnection.toAddress(widget.server.address).then((_connection) {
      print('Connected to the device');
      connection = _connection;
      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });

      connection.input.listen(_onDataReceived).onDone(() {
        // Example: Detect which side closed the connection
        // There should be `isDisconnecting` flag to show are we are (locally)
        // in middle of disconnecting process, should be set before calling
        // `dispose`, `finish` or `close`, which all causes to disconnect.
        // If we except the disconnection, `onDone` should be fired as result.
        // If we didn't except this (no flag set), it means closing by remote.
        if (isDisconnecting) {
          print('Disconnecting locally!');
        } else {
          print('Disconnected remotely!');
        }
        if (this.mounted) {
          setState(() {});
        }
      });
    }).catchError((error) {
      print('Cannot connect, exception occured');
      print(error);
    });
  }

  @override
  void dispose() {
    // Avoid memory leak (`setState` after dispose) and disconnect
    if (isConnected) {
      isDisconnecting = true;
      connection.dispose();
      connection = null;
    }

    super.dispose();
  }

  void checkStatus() {
    if (status) {
      _sendMessage(offButton);
    } else {
      _sendMessage(onButton);
    }
    status = !status;
  }

  @override
  Widget build(BuildContext context) {
    //Chat screen
//    final List<Row> list = messages.map((_message) {
//      return Row(
//        children: <Widget>[
//          Container(
//            child: Text(
//                (text) {
//                  return text == '/shrug' ? '¯\\_(ツ)_/¯' : text;
//                }(_message.text.trim()),
//                style: TextStyle(color: Colors.white)),
//            padding: EdgeInsets.all(12.0),
//            margin: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
//            width: 222.0,
//            decoration: BoxDecoration(
//                color:
//                    _message.whom == clientID ? Colors.blueAccent : Colors.grey,
//                borderRadius: BorderRadius.circular(7.0)),
//          ),
//        ],
//        mainAxisAlignment: _message.whom == clientID
//            ? MainAxisAlignment.end
//            : MainAxisAlignment.start,
//      );
//    }).toList();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: (isConnecting
              ? Text(
                  'Connecting to ' + widget.server.name + '...',
                  style: TextStyle(color: Colors.white),
                )
              : isConnected
                  ? Text(
                      'Send commands to ' + widget.server.name,
                      style: TextStyle(color: Colors.white),
                    )
                  : Text(
                      'Command log with ' + widget.server.name,
                      style: TextStyle(color: Colors.white),
                    )),
          actions: <Widget>[
            FlatButton(
              child: Icon(
                Icons.power_settings_new,
                color: Colors.white,
                semanticLabel: 'Power ON/OFF',
              ),
              onPressed: checkStatus,
            )
          ],
        ),
        body: SafeArea(
            child: Column(children: <Widget>[
          // Chat view
//          Flexible(
//              child: ListView(
//                  padding: const EdgeInsets.all(12.0),
//                  controller: listScrollController,
//                  children: list)),
          Container(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Intensity',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.0),
                          ),
                        ),
                        Knob(
                            value: _valueForIntensity,
                            color: const Color(0xFF1c1b1b),
                            onChanged: _setValueForIntensity,
                            min: minValueForIntensity,
                            max: maxValueForIntensity,
                            size: 100),
                        SizedBox(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.0),
                          ),
                        ),
                        Text(
                          'Value: ${_valueForIntensity.toStringAsFixed(3)}',
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Distance',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.0),
                          ),
                        ),
                        Knob(
                            value: _valueForDistance,
                            color: const Color(0xFF1c1b1b),
                            onChanged: _setValueForDistance,
                            min: minValueForDistance,
                            max: maxValueForDistance,
                            size: 100),
                        SizedBox(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.0),
                          ),
                        ),
                        Text(
                          'Value: ${_valueForDistance.toStringAsFixed(3)}',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Row(children: <Widget>[
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(left: 16.0),
                    child: TextField(
                      style: const TextStyle(fontSize: 15.0),
                      controller: textEditingController,
                      decoration: InputDecoration.collapsed(
                        hintText: (isConnecting
                            ? 'Establishing a connection...'
                            : isConnected
                                ? 'Send Data'
                                : 'Connection Failure...'),
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                      enabled: isConnected,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: isConnected
                          ? () => _sendMessage(textEditingController.text)
                          : null),
                ),
              ]),
            ),
          )
        ])));
  }

  void _onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }
    // Create message if there is new line character
    String dataString = String.fromCharCodes(buffer);
    int index = buffer.indexOf(13);
    if (~index != 0) {
      // \r\n
      setState(() {
        messages.add(_Message(
            1,
            backspacesCounter > 0
                ? _messageBuffer.substring(
                    0, _messageBuffer.length - backspacesCounter)
                : _messageBuffer + dataString.substring(0, index)));
        _messageBuffer = dataString.substring(index);
      });
    } else {
      _messageBuffer = (backspacesCounter > 0
          ? _messageBuffer.substring(
              0, _messageBuffer.length - backspacesCounter)
          : _messageBuffer + dataString);
    }
  }

  void _sendMessage(String text) async {
    textEditingController.clear();

    if (text.length > 0) {
      try {
        connection.output.add(utf8.encode(text));
        await connection.output.allSent;

        setState(() {
          messages.add(_Message(clientID, text));
        });

        Future.delayed(Duration(milliseconds: 333)).then((_) {
          listScrollController.animateTo(
              listScrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 333),
              curve: Curves.easeOut);
        });
      } catch (e) {
        // Ignore error, but notify state
        setState(() {});
      }
    }
  }
}
