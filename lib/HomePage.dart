import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true, // Center the title
        backgroundColor: Color(0xFF6535ee), // Set AppBar background color to #6535ee
      ),
      body: Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}

