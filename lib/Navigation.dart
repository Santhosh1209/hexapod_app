import 'package:flutter/material.dart';
import 'HomePage_Admin.dart'; // Import the admin home page
import 'LiveTrackingPage.dart';
import 'Camera.dart';
import 'SoSQueries.dart';


class AdminNavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminNavigationState(),
    );
  }
}

class AdminNavigationState extends StatefulWidget {
  @override
  State<AdminNavigationState> createState() => _AdminNavigationStateState();
}

class _AdminNavigationStateState extends State<AdminNavigationState> {
  int currentPageIndex = 0;

  // create a list of pages
  final List<Widget> _pages = [
    HomePage_Admin(),
    LiveTrackingPage(),
    AdminCamera(),
    SOSQueries(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            selectedIcon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.place),
            selectedIcon: Icon(Icons.place),
            label: "Live Tracking",
          ),
          NavigationDestination(
            icon: Icon(Icons.camera),
            selectedIcon: Icon(Icons.camera),
            label: "Camera",
          ),
          NavigationDestination(
            icon: Icon(Icons.warning),
            selectedIcon: Icon(Icons.warning),
            label: "SOS Queries",
          ),
        ],
      ),
      body: _pages[currentPageIndex],
    );
  }
}
