// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MapsPage extends StatefulWidget {
//   const MapsPage({super.key});
//
//   @override
//   State<MapsPage> createState() => MapsPageState();
// }
//
// class MapsPageState extends State<MapsPage> {
//   final Completer<GoogleMapController> _controller =
//   Completer<GoogleMapController>();
//   var _maptheme;
//
//   Future _loadMapStyles() async {
//     _maptheme  = await rootBundle.loadString('raw/maptheme.json');
//   }
//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(27.6683, 85.3206),
//     zoom: 14.4746,
//   );
//
//   static const CameraPosition _kLake = CameraPosition(
//
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       zoom: 19.151926040649414);
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _loadMapStyles();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//           controller.setMapStyle(_maptheme);
//
//
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: const Text('To the lake!'),
//         icon: const Icon(Icons.directions_boat),
//       ),
//     );
//   }
//
//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      target: LatLng(27.6683, 85.3206),
      zoom: 10);

 var _maptheme;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  createListOfMarkers() {
    for (int i = 0; i < 10; i++) {
      final double increment = i + 0.8; // Increment for markerId and other data
      final marker = Marker(
        markerId: MarkerId(increment.toString()), // Unique marker ID
        position: LatLng(9.669111 - (0.02 * i), 80.014007 - (0.02 * i)), // Adjust position dynamically
        infoWindow: InfoWindow(
          title: 'T' + increment.toString(), // Proper string concatenation
          snippet: 'A' + increment.toString(), // Proper string concatenation
        ),
      );
      setState(() {
        markers[MarkerId(increment.toString())] = marker;
      });
    }
  }


  Future _loadMapStyles() async {
    _maptheme  = await rootBundle.loadString('raw/maptheme.json');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadMapStyles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        style: _maptheme,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          createListOfMarkers();
          // controller.setMapStyle(_maptheme);
        },
        markers: markers.values.toSet(),

      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('home!'),
        icon: const Icon(Icons.home),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}