import 'package:flutter/material.dart';
import 'Navigation.dart';
import 'User_Navigation.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? selectedRole = 'Type of Account'; // Default role is 'Type of Account'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Color(0xFF6535ee),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300, // Adjust the width as needed
              child: DropdownButton<String>(
                value: selectedRole,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRole = newValue;
                  });
                },
                items: <String>['Type of Account', 'User', 'Admin'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20), // Add spacing
            // TextFormFields for Email and Password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: true, // For password input
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Add spacing
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
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF6535ee), // Change button color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Increase button size
              ),
              child: Text(
                'Log In',
                style: TextStyle(fontSize: 18), // Increase button text size
              ),
            ),
          ],
        ),
      ),
    );
  }
}




