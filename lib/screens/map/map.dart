// import 'dart:async';
// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:uber_app/global/global_var.dart';

// class MapPage extends StatefulWidget {
//   const MapPage({super.key});
//   static String id = "MapScreen";
//   @override
//   State<MapPage> createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   final Completer<GoogleMapController> googleMapCompleterController =
//       Completer<GoogleMapController>();
//   GoogleMapController? controllerGoogleMap;
//   Position? currentPositionOfUser;
//   Set<Marker> markers = Set();
//   void updateMapTheme(GoogleMapController controller) {
//     getJsonFileFromThemes("themes/retio_style.json")
//         .then((value) => setGoogleMapStyle(value, controller));
//   }

//   Future<String> getJsonFileFromThemes(String mapStylePath) async {
//     ByteData byteData = await rootBundle.load(mapStylePath);
//     var list = byteData.buffer
//         .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
//     return utf8.decode(list);
//   }

//   setGoogleMapStyle(String googleMapStyle, GoogleMapController controller) {
//     controller.setMapStyle(googleMapStyle);
//   }

//   Future<void> getCurrentLiveLocationOfUser() async {
//     final String apiUrl =
//         'http://falldetect.somee.com/api/FallEventDetail?id=2'; // Replace with your backend API URL

//     final Dio dio = Dio(); // Create a Dio instance

//     try {
//       // Send an HTTP GET request to your API using Dio
//       final response = await dio.get(apiUrl);

//       // Check if the response status code is 200 (OK)
//       if (response.statusCode == 200) {
//         // Parse the JSON response
//         final Map<String, dynamic> data = response.data;

//         // Extract latitude and longitude from the response data
//         // final int userId = data['userID'];
//         final double latitude = data['fallLocation_Lat'];
//         final double longitude = data['fallLocation_Long'];

//         // Update the currentPositionOfUser with the obtained location
//         currentPositionOfUser = Position(
//           latitude: latitude,
//           longitude: longitude,
//           timestamp: DateTime.now(),
//           accuracy: 0,
//           altitude: 0,
//           heading: 0,
//           speed: 0,
//           speedAccuracy: 0,
//           altitudeAccuracy: 0,
//           headingAccuracy: 0,
//         );

//         // Create a LatLng object for the camera position
//         final LatLng positionOfUserInLatLng = LatLng(
//           currentPositionOfUser!.latitude,
//           currentPositionOfUser!.longitude,
//         );

//         // Update the camera position
//         final CameraPosition cameraPosition = CameraPosition(
//           target: positionOfUserInLatLng,
//           zoom: 15,
//         );
//         controllerGoogleMap!
//             .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//         setState(() {});
//       } else {
//         // Handle API error (e.g., status code other than 200)
//         print('API Request Failed: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle network or other errors
//       print('Error: $e');
//     }
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: const CameraPosition(
//               target: LatLng(37.42796133580664, -122.085749655962),
//               zoom: 13, // Set the initial location here
//             ),
//             mapType: MapType.normal,
//             myLocationButtonEnabled: true,
//             // initialCameraPosition:    ,
//             onMapCreated: (GoogleMapController mapController) {
//               controllerGoogleMap = mapController;
//               updateMapTheme(controllerGoogleMap!);
//               googleMapCompleterController.complete(controllerGoogleMap);
//               getCurrentLiveLocationOfUser();
//               setState(() {});
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
// import 'dart:async';
// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapPage extends StatefulWidget {
//   const MapPage({super.key});
//   static String id = "MapScreen";

//   @override
//   State<MapPage> createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   final Completer<GoogleMapController> googleMapCompleterController =
//       Completer<GoogleMapController>();
//   GoogleMapController? controllerGoogleMap;
//   Position? currentPositionOfUser;
//   Set<Marker> markers = Set();

//   void updateMapTheme(GoogleMapController controller) {
//     getJsonFileFromThemes("themes/retio_style.json")
//         .then((value) => setGoogleMapStyle(value, controller));
//   }

//   Future<String> getJsonFileFromThemes(String mapStylePath) async {
//     ByteData byteData = await rootBundle.load(mapStylePath);
//     var list = byteData.buffer
//         .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
//     return utf8.decode(list);
//   }

//   void setGoogleMapStyle(
//       String googleMapStyle, GoogleMapController controller) {
//     controller.setMapStyle(googleMapStyle);
//   }

//   Future<void> getCurrentLiveLocationOfUser() async {
//     final String apiUrl =
//         'http://falldetect.somee.com/api/FallEventDetail'; // Replace with your backend API URL

//     final Dio dio = Dio(); // Create a Dio instance

//     try {
//       final response = await dio.get(apiUrl);

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = response.data;
//         final double latitude = data['fallLocation_Lat'];
//         final double longitude = data['fallLocation_Long'];

//         currentPositionOfUser = Position(
//           latitude: latitude,
//           longitude: longitude,
//           timestamp: DateTime.now(),
//           accuracy: 0,
//           altitude: 0,
//           heading: 0,
//           speed: 0,
//           speedAccuracy: 0,
//           altitudeAccuracy: 0,
//           headingAccuracy: 0,
//         );

//         final LatLng positionOfUserInLatLng = LatLng(
//           currentPositionOfUser!.latitude,
//           currentPositionOfUser!.longitude,
//         );

//         final CameraPosition cameraPosition = CameraPosition(
//           target: positionOfUserInLatLng,
//           zoom: 15,
//         );

//         controllerGoogleMap!
//             .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

//         // Add a marker for the current location of the user
//         final Marker userLocationMarker = Marker(
//           markerId: MarkerId("currentLocation"),
//           position: positionOfUserInLatLng,
//           infoWindow: InfoWindow(
//             title: "Your Location",
//             snippet: "This is your current location",
//           ),
//           onTap: () {
//             print('tapped');
//           },
//         );

//         setState(() {
//           markers.add(userLocationMarker);
//         });
//       } else {
//         print('API Request Failed: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: const CameraPosition(
//               target: LatLng(37.42796133580664, -122.085749655962),
//               zoom: 13,
//             ),
//             mapType: MapType.normal,
//             myLocationButtonEnabled: true,
//             markers: markers,
//             onMapCreated: (GoogleMapController mapController) {
//               controllerGoogleMap = mapController;
//               updateMapTheme(controllerGoogleMap!);
//               googleMapCompleterController.complete(controllerGoogleMap);
//               getCurrentLiveLocationOfUser();
//             },
//           )
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class MapPage extends StatelessWidget {
//   const MapPage({Key? key}) : super(key: key); // Fix the constructor

//   static String id = "MapScreen";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FlutterMap(
//         options: const MapOptions(
//           initialCenter: LatLng(51.5, -0.09), // Set the initial location here
//           initialZoom: 13.0,
//         ),
//         children: [
//           TileLayer(
//             urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//             subdomains: ['a', 'b', 'c'],
//           ),
//           const MarkerLayer(markers: [
//             Marker(
//               point: LatLng(51.5, -0.09), // Set the marker location here
//               child: Icon(
//                 Icons.location_on,
//                 color: Colors.red,
//               ),
//             )
//           ])
//         ],
//       ),
//     );
//   }
// }
// getCurrentLiveLocationOfUser() async {
//   Position positionOfUser = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.bestForNavigation);
//   currentPositionOfUser = positionOfUser;
//   LatLng positionOfUserInLatLng = LatLng(
//       currentPositionOfUser!.latitude, currentPositionOfUser!.longitude);

//   CameraPosition cameraPosition =
//       CameraPosition(target: positionOfUserInLatLng, zoom: 15);
//   controllerGoogleMap!
//       .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
// }

// Future<void> getCurrentLiveLocationOfUser() async {
//   final String apiUrl =
//       'YOUR_API_URL_HERE'; // Replace with your backend API URL

//   try {
//     // Send an HTTP GET request to your API
//     final response = await http.get(Uri.parse(apiUrl));

//     // Check if the response status code is 200 (OK)
//     if (response.statusCode == 200) {
//       // Parse the JSON response
//       final Map<String, dynamic> data = json.decode(response.body);

//       // Extract latitude and longitude from the response data
//       final double latitude = data['latitude'];
//       final double longitude = data['longitude'];

//       // Update the currentPositionOfUser with the obtained location
//       currentPositionOfUser = Position(
//         latitude: latitude,
//         longitude: longitude,
//       );

//       // Create a LatLng object for the camera position
//       final LatLng positionOfUserInLatLng = LatLng(
//         currentPositionOfUser!.latitude,
//         currentPositionOfUser!.longitude,
//       );

//       // Update the camera position
//       final CameraPosition cameraPosition = CameraPosition(
//         target: positionOfUserInLatLng,
//         zoom: 15,
//       );
//       controllerGoogleMap!
//           .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//     } else {
//       // Handle API error (e.g., status code other than 200)
//       print('API Request Failed: ${response.statusCode}');
//     }
//   } catch (e) {
//     // Handle network or other errors
//     print('Error: $e');
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';

// // class MapScreen extends StatefulWidget {
// //   const MapScreen({super.key});
// //   static String id = "MapScreen";

// //   @override
// //   State<MapScreen> createState() => _MapScreenState();
// // }

// // class _MapScreenState extends State<MapScreen> {
// //   static const LatLng _pGooglePlex = LatLng(37.4223, -122.084);
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: GoogleMap(
// //         initialCameraPosition: CameraPosition(
// //           target: _pGooglePlex,
// //           zoom: 14,
// //         ),
// //         markers: {},
// //       ),
// //     );
// //   }
// // }

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});
  static String id = "MapScreen";

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _googleMapCompleterController =
      Completer<GoogleMapController>();
  GoogleMapController? _controllerGoogleMap;
  Set<Marker> _markers = Set();

  void updateMapTheme(GoogleMapController controller) {
    getJsonFileFromThemes("themes/retio_style.json")
        .then((value) => setGoogleMapStyle(value, controller));
  }

  Future<String> getJsonFileFromThemes(String mapStylePath) async {
    ByteData byteData = await rootBundle.load(mapStylePath);
    var list = byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    return utf8.decode(list);
  }

  void setGoogleMapStyle(
      String googleMapStyle, GoogleMapController controller) {
    controller.setMapStyle(googleMapStyle);
  }

  @override
  void initState() {
    super.initState();
    fetchLocationsAndDisplayMarkers();
  }

  Future<void> fetchLocationsAndDisplayMarkers() async {
    final String apiUrl =
        'http://falldetect.somee.com/api/FallEventDetail'; // Update with the correct API URL
    final Dio dio = Dio();

    try {
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        List<dynamic> usersData = response.data;
        _markers.clear(); // Clear existing markers

        for (var userData in usersData) {
          final marker = Marker(
            markerId: MarkerId("${userData['detailID']}"),
            position: LatLng(
                userData['fallLocation_Lat'], userData['fallLocation_Long']),
            infoWindow: InfoWindow(
              title: "Detail ID: ${userData['detailID']}",
              snippet: "Fall Event ID: ${userData['fallEventID']}",
            ),
            onTap: () {
              // You can handle marker tap here
              print("Tapped on marker with Detail ID: ${userData['detailID']}");
            },
          );

          setState(() {
            _markers.add(marker);
          });
        }
      } else {
        print('Failed to load locations: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching locations: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target:
                  LatLng(21, 0), // Initial position adjusted for demonstration
              zoom: 0, // Initial zoom adjusted for demonstration
            ),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            markers: _markers,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap = controller;
              _googleMapCompleterController.complete(controller);
              updateMapTheme(controller);
              fetchLocationsAndDisplayMarkers();
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
