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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:uber_app/global/global_var.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});
  static String id = "MapScreen";
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> googleMapCompleterController =
      Completer<GoogleMapController>();
  GoogleMapController? controllerGoogleMap;
  Position? currentPositionOfUser;

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

  setGoogleMapStyle(String googleMapStyle, GoogleMapController controller) {
    controller.setMapStyle(googleMapStyle);
  }

  getCurrentLiveLocationOfUser() async {
    Position positionOfUser = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPositionOfUser = positionOfUser;
    LatLng positionOfUserInLatLng = LatLng(
        currentPositionOfUser!.latitude, currentPositionOfUser!.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: positionOfUserInLatLng, zoom: 15);
    controllerGoogleMap!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.42796133580664, -122.085749655962),
            ),
            onMapCreated: (GoogleMapController mapController) {
              controllerGoogleMap = mapController;
              updateMapTheme(controllerGoogleMap!);
              googleMapCompleterController.complete(controllerGoogleMap);
              getCurrentLiveLocationOfUser();
            },
          )
        ],
      ),
    );
  }
}

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
