import 'HomePage.dart';
import 'AnnouncementsPage.dart';
import 'package:flutter/material.dart';
import 'LiveTrackingPage.dart';
import 'FAQPage.dart';

void main() => runApp(const NavigationScreen());

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NavigationState()
    );
  }
}

class NavigationState extends StatefulWidget {
  const NavigationState({super.key});

  @override
  State<NavigationState> createState() => _NavigationStateState();
}

class _NavigationStateState extends State<NavigationState> {
  int currentPageIndex = 0;

  // create a list of pages
  final List<Widget> _pages = [
    HomePage(),
    AnnouncementsPage(),
    LiveTrackingPage(),
    FAQPage(),
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
            icon: Icon(Icons.announcement_rounded),
            selectedIcon: Icon(Icons.announcement),
            label: "Announcements",
          ),
          NavigationDestination(
              icon: Icon(Icons.place),
              selectedIcon: Icon(Icons.place),
              label: "Live Tracking"
          ),
          NavigationDestination(
              icon: Icon(Icons.question_mark),
              selectedIcon: Icon(Icons.question_mark),
              label: "FAQs"
          ),
        ],
      ),
      body: _pages[currentPageIndex],
    );
  }
}