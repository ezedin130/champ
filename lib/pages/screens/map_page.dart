import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'
    if (KIsWeb) 'package:google_maps_flutter_web/google_maps_flutter_web.dart';
import 'package:location/location.dart';
import 'package:map/constant.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Location _locationController = Location();
  final Completer<GoogleMapController> _mapcontroller =
   Completer<GoogleMapController>();
  static const LatLng _pharbu = LatLng(10.9202, 39.7871);
  static const LatLng _pdessie = LatLng(11.1300, 39.6300);
  LatLng? _currentP;
  final Map<PolylineId, Polyline> _polylines = {};
  @override
  void initState() {
    super.initState();
    getLocationUpdates().then((_)=>{
      getPolyLinePoints().then((coordinates)=>{
        generatePolylineFromPoints(coordinates),
      }),
    });
  }

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
        body: _currentP == null
            ? const Center(
                child: Text('Loading'),
              )
            : GoogleMap(
              onMapCreated: ((GoogleMapController controller) =>_mapcontroller.complete(controller)) ,
                initialCameraPosition: const CameraPosition(
                  target: _pdessie,
                  zoom: 13,
                ),
                markers: {
                    Marker(
                    markerId: const MarkerId("_currentLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _currentP!,
                  ),
                  const Marker(
                    markerId: MarkerId("_sourceLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pharbu,
                  ),
                  const Marker(
                    markerId: MarkerId("_destinationLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pdessie,
                  )
                },
                polylines: Set<Polyline>.of(_polylines.values),
              ));
  }
  Future<void> _cameraPosition(LatLng pos)async{
    final GoogleMapController controller = await _mapcontroller.future;
    CameraPosition newCameraPosition = CameraPosition(target: pos,zoom: 13,);
    await controller.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }
  Future<void> getLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await _locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }
    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraPosition(_currentP!);
        });
      }
    });
  }
  Future<List<LatLng>> getPolyLinePoints() async{
    List<LatLng> polyLineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: googleMapApi,
      request: PolylineRequest(origin: PointLatLng(_currentP!.latitude,_currentP!.longitude), destination: PointLatLng(_pdessie.latitude,_pdessie.longitude), mode: TravelMode.driving,),);
    if(result.points.isNotEmpty){
      for (var point in result.points) {
        polyLineCoordinates.add(LatLng(point.latitude,point.longitude));
      }
    }
    else{
      print(result.errorMessage);
    }
    return polyLineCoordinates;
    
  }
  void generatePolylineFromPoints(List<LatLng> polylineCoordinates)async{
    PolylineId id = const PolylineId('poly');
    Polyline polyline = Polyline(polylineId: id, color: Colors.black, points: polylineCoordinates, width: 8,);
    setState(() {
      _polylines[id] = polyline;
    });
  }
}
//AIzaSyC2uueWwYoJJMaQHOMO02vv5llVDD-XWag