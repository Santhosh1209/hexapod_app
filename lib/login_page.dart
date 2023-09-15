import 'package:flutter/material.dart';
import 'Navigation.dart';
import 'User_Navigation.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? selectedRole = 'User'; // Default role is 'User'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: selectedRole,
              onChanged: (String? newValue) {
                setState(() {
                  selectedRole = newValue;
                });
              },
              items: <String>['User', 'Admin'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                // You can now access the selectedRole variable to determine the user's choice.
                // For example, you can check if it's 'User' or 'Admin' and then proceed accordingly.
                if (selectedRole == 'User') {
                  // Handle user login
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavigationScreen()),
                  );
                } else if (selectedRole == 'Admin') {
                  // Handle admin login
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminNavigationScreen()), // Use the admin navigation for admin
                  );
                }
              },
              child: Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}





