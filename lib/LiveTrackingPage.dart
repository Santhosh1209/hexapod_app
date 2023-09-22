import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LiveTrackingPage(),
    );
  }
}

class LiveTrackingPage extends StatefulWidget {
  @override
  _LiveTrackingPageState createState() => _LiveTrackingPageState();
}

class _LiveTrackingPageState extends State<LiveTrackingPage> {
  List<Marker> markers = []; // List of markers for hexapod locations

  @override
  void initState() {
    super.initState();
    // Add initial hexapod location marker
    markers.add(
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(13.0827, 80.2707), // Initial hexapod location (Chennai)
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Colors.red,
            size: 40.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Tracking'),
        backgroundColor: Color(0xFF6535EE),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Gas Sensor'),
                ),
                Text('Temperature: 25°C'),
                Text('Functional Legs: 6'),
                Text('Battery: 80%'),
              ],
            ),
          ),
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(13.0827, 80.2707), // Initial map center (Chennai)
                zoom: 14.0, // Initial zoom level
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: markers, // Add hexapod location markers here
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Latitude: ${markers[0].point.latitude.toStringAsFixed(4)}, Longitude: ${markers[0].point.longitude.toStringAsFixed(4)}',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
