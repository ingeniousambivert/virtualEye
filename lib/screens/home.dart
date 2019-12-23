// For performing some operations asynchronously
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
// For better logging
/// Use standard android logging methods.
import 'package:logger/logger.dart';

// For using the BaseAppBar and BaseBottomBar
import 'package:virtualeye/components/appbar.dart';
import 'package:virtualeye/components/bottombar.dart';

// Helper Services
import 'package:virtualeye/screens/DiscoveryPage.dart';
import 'package:virtualeye/screens/SelectBondedDevicePage.dart';
import 'package:virtualeye/screens/PreferencesPage.dart';

final log = Logger(
    printer: PrettyPrinter(
  methodCount: 0,
  errorMethodCount: 5,
  lineLength: 50,
  colors: true,
  printEmojis: true,
  printTime: false,
));

class Home extends StatefulWidget {
  @override
  _HomePage createState() => new _HomePage();
}

class _HomePage extends State<Home> {
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  String _address = "...";
  String _name = "...";

  Timer _discoverableTimeoutTimer;
  int _discoverableTimeoutSecondsLeft = 0;

  bool _autoAcceptPairingRequests = false;

  @override
  void initState() {
    super.initState();

    // Get current state
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    Future.doWhile(() async {
      // Wait if adapter not enabled
      if (await FlutterBluetoothSerial.instance.isEnabled) {
        return false;
      }
      await Future.delayed(Duration(milliseconds: 0xDD));
      return true;
    }).then((_) {
      // Update the address field
      FlutterBluetoothSerial.instance.address.then((address) {
        setState(() {
          _address = address;
        });
      });
    });

    FlutterBluetoothSerial.instance.name.then((name) {
      setState(() {
        _name = name;
      });
    });

    // Listen for futher state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;

        // Discoverable mode is disabled when Bluetooth gets disabled
        _discoverableTimeoutTimer = null;
        _discoverableTimeoutSecondsLeft = 0;
      });
    });
  }

  @override
  void dispose() {
    FlutterBluetoothSerial.instance.setPairingRequestHandler(null);
    _discoverableTimeoutTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        appBar: AppBar(),
      ),
      bottomNavigationBar: BaseBottomBar(),
      body: Container(
        child: ListView(
          children: <Widget>[
            SwitchListTile(
              title: const Text('Enable Bluetooth'),
              value: _bluetoothState.isEnabled,
              onChanged: (bool value) {
                // Do the request and update with the true value then
                future() async {
                  // async lambda seems to not working
                  if (value)
                    await FlutterBluetoothSerial.instance.requestEnable();
                  else
                    await FlutterBluetoothSerial.instance.requestDisable();
                }

                future().then((_) {
                  setState(() {});
                });
              },
            ),
            Divider(),
            ListTile(
              title: FlatButton(
                  color: const Color(0xFF1c1b1b),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.grey,
                  child: const Text('Discover Devices'),
                  onPressed: () async {
                    final BluetoothDevice selectedDevice =
                        await Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                      return DiscoveryPage();
                    }));

                    if (selectedDevice != null) {
                      print('Discovery -> selected ' + selectedDevice.address);
                    } else {
                      print('Discovery -> no device selected');
                    }
                  }),
            ),
            ListTile(
              title: FlatButton(
                color: const Color(0xFF1c1b1b),
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.grey,
                child: const Text('Manage Paired Devices'),
                onPressed: () async {
                  final BluetoothDevice selectedDevice =
                      await Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                    return SelectBondedDevicePage(checkAvailability: false);
                  }));

                  if (selectedDevice != null) {
                    print('Connect -> Selected ' + selectedDevice.address);
                    _startChat(context, selectedDevice);
                  } else {
                    print('Connect -> No Device Selected');
                  }
                },
              ),
            ),
            ListTile(
              title: FlatButton(
                color: const Color(0xFF1c1b1b),
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.grey,
                child: const Text('Go To MLVision'),
                onPressed: () {
                  Navigator.pushNamed(context, '/mlhome');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startChat(BuildContext context, BluetoothDevice server) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return PreferencesPage(server: server);
    }));
  }
}
