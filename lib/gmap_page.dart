import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GmapPage extends StatefulWidget {
  const GmapPage({super.key});

  @override
  State<GmapPage> createState() => _GmapPageState();
}

class _GmapPageState extends State<GmapPage> {
  final ruminateCoffe = const LatLng(-7.749868618509824, 110.3735274153414);
  late GoogleMapController mapController;

  Marker marker = const Marker(
    markerId: MarkerId("marker_1"),
    position: LatLng(-7.749868618509824, 110.3735274153414),
    infoWindow: InfoWindow(
        title: 'RUMINATE Coffee & Roastery',
        snippet:
            'Jl. Lempongsari Raya No.111, Sumberan, Sariharjo, Kec. Ngaglik, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55581'),
  );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: ruminateCoffe,
            zoom: 15.0,
          ),
          markers: {marker},
        ),
      ),
    );
  }
}
