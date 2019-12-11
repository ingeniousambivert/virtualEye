// For getting the current location
import 'package:geolocator/geolocator.dart';
// For better logging
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

class Location {
  double longitude;
  double latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
      log.i(position);

      latitude = position.latitude;
      longitude = position.longitude;
    } on Exception catch (e) {
      log.e("EXCEPTION:");
      log.e(e);
      // Default values to a locality in Ahmedabad.
      latitude = 23.0271;
      longitude = 72.5515;
    }
  }

  void showLocation() {
    log.i("Latitude : $latitude");
    log.i("Longitude : $longitude");
  }
}
