import 'package:flutter/material.dart';
import 'signup.dart';
import 'login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hexapod App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hexapod Control App'),
        backgroundColor: Color(0xFF6535ee), // Set AppBar background color
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Large Image
            Image(
              image: AssetImage('images/undraw_fixing_bugs_w7gi.png'),
              height: 200, // Adjust the height as needed
              fit: BoxFit.contain, // Adjust the fit as needed
            ),

            // Heading Text
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Welcome to Hexapod Control',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Spacing
            SizedBox(height: 20.0),

            // Some More Text
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              textAlign: TextAlign.center,
            ),

            // More Spacing
            SizedBox(height: 40.0),

            // Buttons for User and Admin
            Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6535ee), // Button color
                    minimumSize: Size(200, 50), // Set button size
                  ),
                  child: Text('Sign Up'),
                ),
                SizedBox(height: 10.0), // Spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6535ee), // Button color
                    minimumSize: Size(200, 50), // Set button size
                  ),
                  child: Text('Log In'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



