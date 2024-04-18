import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController;
      final LatLng _center = LatLng(20.593683, 78.962883); //where we can start when entering into the map
  Set<Marker>markers = {
    Marker(markerId: MarkerId('marker'),
    position: LatLng(12.9716, 77.5646), // bangalore location
    infoWindow: InfoWindow(
      title: 'Your Location',
      snippet: 'place'
    ),),
    Marker(markerId: MarkerId('marker'),
      position: LatLng(13.0827, 80.2707), // chennai location
      infoWindow: InfoWindow(
          title: 'chennai',
          snippet: 'place'
      ),),

  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
          initialCameraPosition:CameraPosition(
              target: _center,
              zoom: 15,),
          mapType: MapType.terrain,

          markers: markers,),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
