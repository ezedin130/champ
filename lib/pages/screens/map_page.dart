import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'
    if (KIsWeb) 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const LatLng _pkocha = LatLng(11.0816, 39.7434);
  static const LatLng _pdessie = LatLng(11.1300, 39.6300);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Center(
            child: Text(
              'Champ',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  //call the slidable from right
                },
                child: const Icon(
                  Icons.list,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        body: GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: _pkocha,
            zoom: 13,
          ),
          markers: {
            const Marker(
              markerId: MarkerId("_currentLocation"),
              icon: BitmapDescriptor.defaultMarker,
              position: _pkocha,
            ),
            const Marker(
              markerId: MarkerId("_sourceLocation"),
              icon: BitmapDescriptor.defaultMarker,
              position: _pdessie,
            )
          },
        ));
  }
}
//AIzaSyC2uueWwYoJJMaQHOMO02vv5llVDD-XWag