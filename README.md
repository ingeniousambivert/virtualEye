CREDITS : @edufolly

# `flutter_bluetooth_serial`

Flutter basic implementation for Classical Bluetooth (only RFCOMM for now).

## TRY

CD to example/ and try the Example application.

## Features

The first goal of this project, started by `Edufolly` was making an interface for Serial Port Protocol (HC-05 Adapter). Now the plugin features:

- Adapter status monitoring,

- Turning adapter on and off,

- Opening settings,

- Discovering devices (and requesting discoverability),

- Listing bonded devices and pairing new ones,

- Connecting to multiple devices at the same time,

- Sending and recieving data (multiple connections).

The plugin (for now) uses Serial Port profile for moving data over RFCOMM, so make sure there is running Service Discovery Protocol that points to SP/RFCOMM channel of the device. There could be [max up to 7 Bluetooth connections](https://stackoverflow.com/a/32149519/4880243).

For now there is only Android support.

## Getting Started

#### Depending

```yaml
# Add dependency to `pubspec.yaml` of your project.
dependencies:
  # ...
  flutter_bluetooth_serial: ^0.2.2
```

#### Installing

```bash
# With pub manager
pub get
# or with Flutter
flutter pub get
```

#### Importing

```dart
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
```

#### Usage

You should look to the Dart code of the library (mostly documented functions) or to the examples code.

```dart
// Some simplest connection :F
try {
    BluetoothConnection connection = await BluetoothConnection.toAddress(address);
    print('Connected to the device');

    connection.input.listen((Uint8List data) {
        print('Data incoming: ${ascii.decode(data)}');
        connection.output.add(data); // Sending data

        if (ascii.decode(data).contains('!')) {
            connection.finish(); // Closing connection
            print('Disconnecting by local host');
        }
    }).onDone(() {
        print('Disconnected by remote request');
    });
}
catch (exception) {
    print('Cannot connect, exception occured');
}
```
