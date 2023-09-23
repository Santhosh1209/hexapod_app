import 'package:flutter/material.dart';

class SOSQueries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample SOS query data
    List<Map<String, dynamic>> sosQueries = [
      {
        'username': 'User 1',
        'latitude': 13.0827,
        'longitude': 80.2707,
        'time': '10:15 AM',
        'date' :  '2023-09-30',
      },
      {
        'username': 'User 2',
        'latitude': 40.7128,
        'longitude': -74.0060,
        'time': '11:30 AM',
        'date' : '2023-09-30 ',
      },
      // Add more SOS query data as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('SOS Queries'),
        centerTitle: true,
        backgroundColor: Color(0xFF6535ee),
      ),
      body: ListView.builder(
        itemCount: sosQueries.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            elevation: 2.0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Make the content scroll horizontally
              child: DataTable(
                columnSpacing: 20.0, // Adjust column spacing
                columns: [
                  DataColumn(label: Text('Username')),
                  DataColumn(label: Text('Latitude')),
                  DataColumn(label: Text('Longitude')),
                  DataColumn(label: Text('Time')),
                  DataColumn(label: Text('Date'))
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text(sosQueries[index]['username'])),
                      DataCell(Text(sosQueries[index]['latitude'].toString())),
                      DataCell(Text(sosQueries[index]['longitude'].toString())),
                      DataCell(
                        Container(
                          width: 120.0, // Adjust width as needed
                          child: Text(
                            sosQueries[index]['time'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(fontSize: 14.0), // Adjust font size
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                          width: 120.0, // Adjust width as needed
                          child: Text(
                            sosQueries[index]['date'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(fontSize: 14.0), // Adjust font size
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
