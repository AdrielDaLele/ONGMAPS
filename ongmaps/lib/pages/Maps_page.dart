import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Importando o Google Maps

class GoogleMapsFlutter extends StatefulWidget {
  const GoogleMapsFlutter({super.key});

  @override
  State<GoogleMapsFlutter> createState() => _GoogleMapsFlutterState();
}

class _GoogleMapsFlutterState extends State<GoogleMapsFlutter> {
  LatLng myCurrentLocation = const LatLng(-22.9064, -47.0616); // Exemplo de localização

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: myCurrentLocation,
          zoom: 15,
        ),
      ),
    );
  }
}
