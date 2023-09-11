import 'package:flutter/material.dart';
import 'Navigation.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NavigationScreen()));
          },
          child: Text('Log In'),
        ),
      ),
    );
  }
}


