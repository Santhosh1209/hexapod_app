import 'package:flutter/material.dart';
import 'login_page.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an Account'),
        centerTitle: true,
        backgroundColor: Color(0xFF6535ee), // Set AppBar background color
      ),
      backgroundColor: Colors.white, // Set background color to pure white
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome Onboard!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Enter the following details to continue', // Add this line
                style: TextStyle(
                  fontSize: 14.0, // Adjust the font size
                  color: Colors.grey, // Set text color to light grey
                ),
              ),
              SizedBox(height: 50.0), // Increased spacing

              // Text Fields Inside Bubble Containers with Spacing
              _buildBubbleTextField('Enter your Name', fieldHeight: 50.0, fontSize: 18.0),
              SizedBox(height: 20.0),
              _buildBubbleTextField('Enter your Mail ID', fieldHeight: 50.0, fontSize: 18.0),
              SizedBox(height: 20.0),
              _buildBubbleTextField('Enter your password', obscureText: true, fieldHeight: 50.0, fontSize: 18.0),
              SizedBox(height: 20.0),
              _buildBubbleTextField('Confirm your password', obscureText: true, fieldHeight: 50.0, fontSize: 18.0),
              SizedBox(height: 50.0), // Increased spacing

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  // Handle registration submission here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6535ee), // Button color
                  minimumSize: Size(200, 50), // Set button size
                ),
                child: Text('Register', style: TextStyle(fontSize: 18.0)),
              ),
              SizedBox(height: 20.0),

              // Login Message
              GestureDetector(
                onTap: () {
                  // Handle the login action here when "Log in" is tapped
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    children: [
                      TextSpan(
                        text: 'Log in',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6535ee), // Set link color
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(text: ' here.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBubbleTextField(String labelText, {bool obscureText = false, double fieldHeight = 50.0, double fontSize = 18.0}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      width: double.infinity, // Match the width of other fields
      height: fieldHeight, // Set the field height
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF6535ee)),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        style: TextStyle(fontSize: fontSize), // Adjust the font size
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

