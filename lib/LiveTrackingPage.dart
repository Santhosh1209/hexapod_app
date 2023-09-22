import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:fl_chart/fl_chart.dart';

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
  String selectedGas = 'Nitrogen'; // Selected gas for pie chart
  double latitude = 13.0827; // Initial latitude
  double longitude = 80.2707; // Initial longitude
  bool showExternalData = false;

  @override
  void initState() {
    super.initState();
    // Add initial hexapod location marker in Chennai
    markers.add(
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(latitude, longitude), // Chennai location
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

  void _showPieChart() {
    List<PieChartSectionData> sections = [];

    if (selectedGas == 'Nitrogen') {
      sections = [
        PieChartSectionData(
          value: 60.0,
          color: Colors.blue,
          title: 'Nitrogen',
          titleStyle: TextStyle(fontSize: 12.0, color: Colors.black),
        ),
        PieChartSectionData(
          value: 30.0,
          color: Colors.red,
          title: 'Oxygen',
          titleStyle: TextStyle(fontSize: 12.0, color: Colors.black),
        ),
        PieChartSectionData(
          value: 5.0,
          color: Colors.green,
          title: 'Argon',
          titleStyle: TextStyle(fontSize: 12.0, color: Colors.black),
        ),
        PieChartSectionData(
          value: 5.0,
          color: Colors.yellow,
          title: 'CO2',
          titleStyle: TextStyle(fontSize: 12.0, color: Colors.black),
        ),
      ];
    }

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300.0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    'Gas Sensor Composition',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  width: 200,
                  height: 200,
                  child: PieChart(
                    PieChartData(
                      sections: sections,
                      centerSpaceRadius: 40.0,
                      sectionsSpace: 0,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  '(Nitrogen 60% : Oxygen 30% : Argon 5% : CO2 5%)',
                  style: TextStyle(fontSize: 12.0, color: Colors.black),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Tracking'),
        backgroundColor: Color(0xFF6535EE),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Latitude: ${latitude.toStringAsFixed(4)}, Longitude: ${longitude.toStringAsFixed(4)}',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Expanded( // Map
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(latitude, longitude),
                zoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: markers,
                ),
              ],
            ),
          ),
          Container( // Features
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showExternalData = !showExternalData;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xFF6535EE), width: 1.0),
                      ),
                    ),
                    child: Text(
                      'External Data',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                if (showExternalData)
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGas = 'Nitrogen';
                          });
                          _showPieChart();
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Gas Sensor Composition',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Spacer(),
                              Icon(
                                Icons.pie_chart,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Temperature',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Spacer(),
                            Text(
                              '25°C',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(width: 8.0),
                            Icon(
                              Icons.wb_sunny,
                              size: 20.0,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle Battery Percentage feature
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Battery Percentage',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Spacer(),
                              Text(
                                '80%',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(width: 8.0),
                              Icon(
                                Icons.battery_charging_full,
                                size: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle Functional Legs feature
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Functional Legs',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Spacer(),
                              Text(
                                '6/6',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(width: 8.0),
                              Icon(
                                Icons.bug_report_rounded,
                                size: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
