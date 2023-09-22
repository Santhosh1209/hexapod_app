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
        title: Text('Login Page'),
        centerTitle: true,
        backgroundColor: Color(0xFF6535ee),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 60),
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 10), // Increased spacing
              Text(
                'Enter these details to log into your account',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: Color(0xFF6535ee)),
                ),
                child: DropdownButtonFormField<String>(
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              SizedBox(height: 20), // Increased spacing
              Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: Color(0xFF6535ee)),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              SizedBox(height: 20), // Increased spacing
              Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: Color(0xFF6535ee)),
                ),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              SizedBox(height: 45),
              ElevatedButton(
                onPressed: () {
                  if (selectedRole == 'User') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NavigationScreen()),
                    );
                  } else if (selectedRole == 'Admin') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminNavigationScreen()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF6535ee),
                  padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Add logic for handling Forgot Password
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color(0xFF6535ee),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}