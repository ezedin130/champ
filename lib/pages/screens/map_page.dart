import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:map/constant.dart';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  LatLng? _currentLocation;
  final LatLng _destination =
      const LatLng(11.06698476344123, 39.742075673508175);

  // final LatLng total3 = const LatLng(11.144859982466429, 39.6439907392908);

  // final LatLng dawdo = const LatLng(11.140754796481549, 39.63142972959967);

  // final LatLng ybp = const LatLng(11.145003487531914, 39.63582782848319);

  // final LatLng ajip = const LatLng(11.115745319810488, 39.63278137363682);

  // final LatLng total1 = const LatLng(11.086298277528487, 39.736210492771086);

  // final LatLng total2 = const LatLng(11.06698476344123, 39.742075673508175);

  // final LatLng yetebaberut =
  //     const LatLng(11.089240245048883, 39.72042426384241);

  // final LatLng oldshell = const LatLng(11.087068843386573, 39.71128663042189);

  // final LatLng shell = const LatLng(11.081548445153029, 39.74352687293633);
  bool _isLoading = true;

  // Sets to hold markers and polylines for GoogleMap.
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  GoogleMapController? _mapController;

  final TextEditingController _searchController = TextEditingController();

class _MapPageState extends State<MapPage> {
  final Location _locationController = Location();
  final Completer<GoogleMapController> _mapcontroller =
   Completer<GoogleMapController>();
  static const LatLng _pharbu = LatLng(10.9202, 39.7871);
  static const LatLng _pdessie = LatLng(11.1300, 39.6300);
  LatLng? _currentP;
  final Map<PolylineId, Polyline> _polylines = {};
class MapPageState extends State<MapPage> {
  LatLng? _currentLocation;
  final LatLng _destination =
      const LatLng(11.06698476344123, 39.742075673508175);

  // final LatLng total3 = const LatLng(11.144859982466429, 39.6439907392908);

  // final LatLng dawdo = const LatLng(11.140754796481549, 39.63142972959967);

  // final LatLng ybp = const LatLng(11.145003487531914, 39.63582782848319);

  // final LatLng ajip = const LatLng(11.115745319810488, 39.63278137363682);

  // final LatLng total1 = const LatLng(11.086298277528487, 39.736210492771086);

  // final LatLng total2 = const LatLng(11.06698476344123, 39.742075673508175);

  // final LatLng yetebaberut =
  //     const LatLng(11.089240245048883, 39.72042426384241);

  // final LatLng oldshell = const LatLng(11.087068843386573, 39.71128663042189);

  // final LatLng shell = const LatLng(11.081548445153029, 39.74352687293633);
  bool _isLoading = true;

  // Sets to hold markers and polylines for GoogleMap.
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  GoogleMapController? _mapController;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchCurrentLocation();
    _addMarkers();
  }

  /// Fetches the current location and then retrieves and sets the route.
  Future<void> _fetchCurrentLocation() async {
    try {
      LatLng location = await getCurrentLocation();
      setState(() {
        _currentLocation = location;
      });
      _fetchAndSetRoute(location, _destination);
      _addMarkers();
    } catch (e) {
      print('Error fetching location: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Fetches the current location using the geolocator package.
  Future<LatLng> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }

    Position position = await Geolocator.getCurrentPosition();
    return LatLng(position.latitude, position.longitude);
  }

  /// Fetches a driving route from OSRM between [start] and [end].
  Future<List<LatLng>> fetchRoute(LatLng start, LatLng end) async {
    final String url =
        'http://router.project-osrm.org/route/v1/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?overview=full&geometries=geojson';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> coordinates =
          data['routes'][0]['geometry']['coordinates'];

      // Convert coordinates to LatLng objects.
      return coordinates.map((coord) => LatLng(coord[1], coord[0])).toList();
    } else {
      throw Exception('Failed to fetch route: ${response.statusCode}');
    }
  }

  final List<Map<String, dynamic>> markerData = [
    {
      'id': 'Total energies 1',
      'position': const LatLng(11.090862777859973, 39.71813274844114),
      'title': 'Total Energies',
    },
    {
      'id': 'Total energies 2',
      'position': const LatLng(11.086298277528487, 39.736210492771086),
      'title': 'Total Energies',
    },
    {
      'id': 'Yetebaberut',
      'position': const LatLng(11.089240245048883, 39.72042426384241),
      'title': 'Yetebaberut',
    },
    {
      'id': 'oldshell',
      'position': const LatLng(11.087068843386573, 39.71128663042189),
      'title': 'Old Shell Gas Station',
    },
    {
      'id': 'shell',
      'position': const LatLng(11.081548445153029, 39.74352687293633),
      'title': 'Shell Station',
    },
    {
      'id': 'Total energies 3',
      'position': const LatLng(11.144859982466429, 39.6439907392908),
      'title': 'Total Energies',
    },
    {
      'id': 'Dawdo gas station',
      'position': const LatLng(11.140754796481549, 39.63142972959967),
      'title': 'Dawdo gas station',
    },
    {
      'id': 'ybp',
      'position': const LatLng(11.145003487531914, 39.63582782848319),
      'title': 'DestinatDESSIE YBP *** Yetebaberution',
    },
    {
      'id': 'ajip',
      'position': const LatLng(11.115745319810488, 39.63278137363682),
      'title': 'Ajip gas station',
    },
  ];

  /// Adds markers for the current location and destination.
  void _addMarkers() {
    if (_currentLocation != null) {
      _markers.add(
        Marker(
          markerId: const MarkerId('currentLocation'),
          position: _currentLocation!,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          infoWindow: const InfoWindow(title: 'Your Location'),
        ),
      );
    }
    for (var marker in markerData) {
      _markers.add(
        Marker(
          markerId: MarkerId(marker['id']),
          position: marker['position'],
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(title: marker['title']),
          onTap: () => _onMarkerTap(marker['position']),
        ),
      );
    }
  }
  void _onMarkerTap(LatLng markerPosition) async {
    // Show a confirmation dialog
    bool confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Draw Polyline?'),
        content: const Text('Do you want to draw a polyline from your location to this marker?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );

    if (confirm == true && _currentLocation != null) {
      // Fetch the route and draw the polyline
      _fetchAndSetRoute(_currentLocation!, markerPosition);
    }
  }


  /// Fetches the route between [start] and [end] and displays it as a polyline.
  Future<void> _fetchAndSetRoute(LatLng start, LatLng end) async {
  try {
    // Fetch route points from an API or service
    List<LatLng> routePoints = await fetchRoute(start, end);

    // Update the state to add the polyline
    setState(() {
      _polylines.add(
        Polyline(
          polylineId: const PolylineId('route'),
          points: routePoints,
          color: const Color.fromARGB(255, 28, 0, 185),
          width: 4,
        ),
      );
      _isLoading = false; // Set loading state to false
    });
  } catch (e) {
    // Handle errors
    print('Error fetching route: $e');
    setState(() {
      _isLoading = false; // Set loading state to false even if there's an error
    });
  }
}

  void _goToCurrentLocation() async {
    if (_currentLocation != null && _mapController != null) {
      _mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: _currentLocation!, zoom: 15.0),
        ),
      );
    }
  }

  Future<void> _onSearch() async {
    final query = _searchController.text;
    if (query.isEmpty) return;

    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?address=$query&key=$googleMapApi');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        final results = data['results'] as List<dynamic>;
        if (results.isNotEmpty) {
          final location = results[0]['geometry']['location'];
          final lat = location['lat'];
          final lng = location['lng'];
          final searchedLocation = LatLng(lat, lng);

          setState(() {
            _markers.add(
              Marker(
                markerId: const MarkerId('searchedLocation'),
                position: searchedLocation,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen),
                infoWindow: InfoWindow(title: query),
              ),
            );
            _mapController
                ?.animateCamera(CameraUpdate.newLatLng(searchedLocation));
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Champ',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter a location',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _onSearch,
                ),
              ),
            ),
          ),
          Expanded(
            child: _isLoading || _currentLocation == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GoogleMap(
                    mapType: MapType.hybrid,
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      _mapController = controller;
                    },
                    initialCameraPosition: CameraPosition(
                      target: _currentLocation!,
                      zoom: 13.0,
                    ),
                    markers: _markers,
                    polylines: _polylines,
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToCurrentLocation,
        child: const Icon(
          Icons.my_location,
        ),
      ),
    );
  }
}
}