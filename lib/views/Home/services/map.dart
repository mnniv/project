import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();
  LatLng _currentLocation = const LatLng(31.9407196, 5.2847669);
  List<Map<String, dynamic>> _markers = [];
  List<Map<String, dynamic>> _filteredMarkers = [];

  @override
  void initState() {
    super.initState();
    _initializeMarkers();
    _getCurrentLocation();
  }

  void _initializeMarkers() {
    _markers = [
      {'name': 'شنين قدور', 'location': const LatLng(31.9593031, 5.2670245)},
      {'name': 'Unknown', 'location': const LatLng(31.9527488, 5.2659915)},
      {'name': 'Unknown', 'location': const LatLng(31.9484678, 5.2649844)},
      {
        'name': '1962 فيفري 27',
        'location': const LatLng(31.9401146, 5.2748618)
      },
      {
        'name': 'المحطة متعددة الخدمات',
        'location': const LatLng(31.9378236, 5.2818444)
      },
      {
        'name': 'القطب الجامعي الجديد',
        'location': const LatLng(31.9407196, 5.2847669)
      },
      {'name': 'تمام أحمد', 'location': const LatLng(31.9441444, 5.2910547)},
      {
        'name': 'العلامة محمد بن الحاج عيسى',
        'location': const LatLng(31.9425189, 5.2997220)
      },
      {'name': 'بن عطية جلول', 'location': const LatLng(31.9418965, 5.3076756)},
      {'name': 'الشطي الوكال', 'location': const LatLng(31.9419036, 5.3127951)},
      {'name': 'المخادمة', 'location': const LatLng(31.9432311, 5.3176418)},
      {'name': 'حساني الطيب', 'location': const LatLng(31.9450983, 5.3226674)},
      {
        'name': 'زوبيدي عبد القادر',
        'location': const LatLng(31.9470917, 5.3254869)
      },
      {
        'name': 'بن عباس حمادي',
        'location': const LatLng(31.9496189, 5.3291041)
      },
      {
        'name': 'العقيد صديقي العربي',
        'location': const LatLng(31.9521980, 5.3328144)
      },
      {'name': 'سيد روحو', 'location': const LatLng(31.9549952, 5.3311930)},
    ];
    _filteredMarkers = List.from(_markers);
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      _currentLocation = const LatLng(31.9407196, 5.2847669);
      _mapController.move(_currentLocation, 17.0);
    });
  }

  void _filterMarkers(String query) {
    setState(() {
      _filteredMarkers = _markers
          .where((marker) =>
              marker['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _navigateToMarker(LatLng location) {
    _mapController.move(location, 17.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Ouargla Tramway',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _currentLocation,
              initialZoom: 17.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: const ['a', 'b', 'c'],
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: [
                      const LatLng(31.9593031, 5.2670245),
                      const LatLng(31.9584552, 5.2676762),
                      const LatLng(31.9558371, 5.2671822),
                      const LatLng(31.954591, 5.266979),
                      const LatLng(31.9527488, 5.2659915),
                      const LatLng(31.949436, 5.264972),
                      const LatLng(31.948999, 5.264900),
                      const LatLng(31.947600, 5.265110),
                      const LatLng(31.947255, 5.265208),
                      const LatLng(31.945963, 5.266212),
                      const LatLng(31.945371, 5.266400),
                      const LatLng(31.943978, 5.266598),
                      const LatLng(31.943322, 5.267032),
                      const LatLng(31.942913, 5.267600),
                      const LatLng(31.942735, 5.267912),
                      const LatLng(31.9401146, 5.2748618),
                      const LatLng(31.9378236, 5.2818444),
                      const LatLng(31.937587, 5.282686),
                      const LatLng(31.937609, 5.283093),
                      const LatLng(31.937965, 5.283791),
                      const LatLng(31.9407196, 5.2847669),
                      const LatLng(31.943363, 5.285695),
                      const LatLng(31.943705, 5.285911),
                      const LatLng(31.943942, 5.286146),
                      const LatLng(31.944156, 5.286586),
                      const LatLng(31.944265, 5.287085),
                      const LatLng(31.9441444, 5.2910547),
                      const LatLng(31.943942, 5.293093),
                      const LatLng(31.9425189, 5.2997220),
                      const LatLng(31.941980, 5.302663),
                      const LatLng(31.9418965, 5.3076756),
                      const LatLng(31.941798, 5.311713),
                      const LatLng(31.9419036, 5.3127951),
                      const LatLng(31.942412, 5.314862),
                      const LatLng(31.9432311, 5.3176418),
                      const LatLng(31.944470, 5.321776),
                      const LatLng(31.9450983, 5.3226674),
                      const LatLng(31.9470917, 5.3254869),
                      const LatLng(31.9496189, 5.3291041),
                      const LatLng(31.9521980, 5.3328144),
                      const LatLng(31.952526, 5.333315),
                      const LatLng(31.952654, 5.333375),
                      const LatLng(31.952827, 5.333337),
                      const LatLng(31.9549952, 5.3311930),
                    ],
                    strokeWidth: 9.0,
                    color: Colors.red,
                  ),
                ],
              ),
              MarkerLayer(
                markers: _filteredMarkers
                    .map((marker) => _buildMarker(marker['location']))
                    .toList(),
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search for station...',
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _searchController.clear();
                            _filterMarkers('');
                          },
                        ),
                      ),
                      onChanged: _filterMarkers,
                    ),
                    if (_searchController.text.isNotEmpty)
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: _filteredMarkers.length,
                          itemBuilder: (context, index) {
                            final marker = _filteredMarkers[index];
                            return ListTile(
                              title: Text(marker['name']),
                              onTap: () {
                                _navigateToMarker(marker['location']);
                                _searchController.clear();
                                _filterMarkers('');
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.my_location,
          color: Colors.blue,
        ),
      ),
    );
  }

  Marker _buildMarker(LatLng location) {
    return Marker(
      point: location,
      child: const Icon(
        CupertinoIcons.location_solid,
        color: Colors.blue,
        size: 45,
      ),
    );
  }
}
