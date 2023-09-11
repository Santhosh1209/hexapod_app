import 'package:flutter/material.dart';
import 'HomePage.dart';

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
            // Replace this with your actual login logic.
            // After successful login, navigate to the Home page.
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          child: Text('Log In'),
        ),
      ),
    );
  }
}


