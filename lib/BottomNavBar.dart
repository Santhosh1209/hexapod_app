import 'package:flutter/material.dart';
import 'login_page.dart';
import 'HomePage.dart';
import 'AnnouncementsPage.dart';
import 'FAQPage.dart';
import 'LiveTrackingPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hexapod Control',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Initial screen is the login page.
      routes: {
        '/home': (context) => HomePage(),
        // Add routes for announcements, live tracking, and FAQs pages here.
      },
    );
  }
}

