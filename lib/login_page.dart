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
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Enter these details to log into your account',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 60),
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
              SizedBox(height: 20),
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
              SizedBox(height: 20),
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
              SizedBox(height: 40),
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
                  padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16), // Adjust padding for a slightly larger button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 10), // Add spacing between Log In button and Forgot Password button
              TextButton(
                onPressed: () {
                  // Add logic for handling Forgot Password
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color(0xFF6535ee), // Text color in 6535ee color
                    decoration: TextDecoration.underline, // Underline text
                  ),
                ),
              ),
              SizedBox(height: 20), // Add spacing between buttons and social media icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      //
                    },
                    child: Image(
                      image: AssetImage('images/google.png'),
                      height: 40,
                      width: 30,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //
                    },
                    child: Image(
                      image: AssetImage('images/facebook-app-symbol.png'),
                      height: 40,
                      width: 30,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //
                    },
                    child: Image(
                      image: AssetImage('images/twitter-sign.png'),
                      height: 40,
                      width: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}