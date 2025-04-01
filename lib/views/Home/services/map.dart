import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Theme.of(context).scaffoldBackgroundColor,
        title: Text('Ouargla Tramway'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter:
              LatLng(31.95, 5.33), // Center of the map at the tramway route
          initialZoom: 17.0, // Adjusted zoom level for better visibility
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                points: [
                  LatLng(31.95, 5.33), // Starting point of the tramway
                  LatLng(31.96, 5.34), // Intermediate point
                  LatLng(31.97, 5.35), // Ending point of the tramway
                ],
                strokeWidth: 4.0,
                color: Colors.red,
              ),
            ],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(31.95, 5.33), // Station 1
                child: Container(
                  child: Icon(Icons.location_on, color: Colors.green, size: 40),
                ),
              ),
              Marker(
                point: LatLng(31.951, 5.331), // Station 2
                child: Container(
                  child: Icon(Icons.location_on, color: Colors.blue, size: 40),
                ),
              ),
              Marker(
                point: LatLng(31.952, 5.332), // Station 3
                child: Container(
                  child:
                      Icon(Icons.location_on, color: Colors.orange, size: 40),
                ),
              ),
              Marker(
                point: LatLng(31.953, 5.333), // Station 4
                child: Container(
                  child:
                      Icon(Icons.location_on, color: Colors.purple, size: 40),
                ),
              ),
              Marker(
                point: LatLng(31.954, 5.334), // Station 5
                child: Container(
                  child: Icon(Icons.location_on, color: Colors.red, size: 40),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
