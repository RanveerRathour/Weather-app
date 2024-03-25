// import 'package:geolocator/geolocator.dart';
// import 'package:logger/logger.dart';

// class FetchPositionRepository {
//   final Logger _logger = Logger();

//   Future<Position?> getCurrentLocation() async {
//     try {
//       final Position? lastposition = await Geolocator.getLastKnownPosition(
//         forceAndroidLocationManager: true,
//       );

//       final LocationPermission permission = await _checkLocationPermission();
//       if (permission == LocationPermission.denied ||
//           permission == LocationPermission.deniedForever ||
//           permission == LocationPermission.unableToDetermine) {
//         if (lastposition != null) {
//           return lastposition;
//         }
//         throw LocationPermissionDeniedException();
//       }

//       if (!await _checkLocationServicesEnabled()) {
//         if (lastposition != null) {
//           return lastposition;
//         }
//         throw LocationServicesDisabledException();
//       }

//       final Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//       return position;
//     } catch (e) {
//       _logger.e('Error determining position ${e.toString()}');
//       return null;
//     }
//   }

//   Future<bool> _checkLocationServicesEnabled() async {
//     final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       _logger.w('Location services disabled');
//     }

//     return serviceEnabled;
//   }

//   Future<LocationPermission> _checkLocationPermission() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     print('inside function');
//     print(permission);

//     if (permission != LocationPermission.always &&
//         permission != LocationPermission.whileInUse) {
//       print('inside condition');
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied ||
//           permission == LocationPermission.deniedForever) {
//         _logger.w('Location permission denied');
//       }
//     }

//     return permission;
//   }
// }

// class LocationServicesDisabledException implements Exception {}

// class LocationPermissionDeniedException implements Exception {}
