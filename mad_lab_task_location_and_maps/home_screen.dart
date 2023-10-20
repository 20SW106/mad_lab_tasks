import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.422, 73.0033),
    zoom: 14.4746,
  );

  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(37.422, 73.0033),
      infoWindow: InfoWindow(
        title: 'My current location',
      ),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(37.423422, 73.0033523),
      infoWindow: InfoWindow(
        title: 'e-11 sector',
      ),
    ),
    Marker(
      markerId: MarkerId('3'), // Unique marker ID
      position: LatLng(37.423422, 73.0033523),
      infoWindow: InfoWindow(
        title: 'e-2 sector',
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_marker),
          mapType: MapType.normal,
          myLocationEnabled: true,
          compassEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_disabled_outlined),
        onPressed: () async {
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(37.422, 73.0033),
                zoom: 14),
          ));
          setState(() {});
        },
      ),
    );
  }
}
