// ignore_for_file: prefer_collection_literals, camel_case_types
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../function/loction_map.dart';
import '../../static/static.dart';

class MapGloply extends StatefulWidget {
  const MapGloply({super.key});
  static const String id = "MapGloply";
  @override
  State<MapGloply> createState() => _MapGloplyState();
}

class _MapGloplyState extends State<MapGloply> {
  final Set<Marker> markers = Set();
  static Position? position;
  static final CameraPosition _kGooglePlex = CameraPosition(
    // target: LatLng(position!.latitude, position!.longitude),
    target: LatLng(position!.latitude, position!.longitude),
    zoom: 8.4746,
  );

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation()
        .whenComplete(() => setState(() {}));
    positionGlobly = position;
    print(
        "latitude =${position!.latitude} , longitude = ${position!.longitude}");
  }

  String? val;
  @override
  void initState() {
    getMyCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: position != null
          ? GoogleMap(
              mapType: MapType.terrain,
              myLocationEnabled: true,
              zoomControlsEnabled: true,
              myLocationButtonEnabled: true,
              initialCameraPosition: _kGooglePlex,
            )
          : Center(
              child: Container(
                child: const CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            ),
    );
  }
}
