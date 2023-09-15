import 'package:flutter/material.dart';

class ColoredDivider extends StatelessWidget {
  final Color color;

  ColoredDivider({required this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      thickness: 1.0,
      height: 1.0,
    );
  }
}

class MyAccountPage extends StatefulWidget {
  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    final dividerColor = Color(0xFF6535ee);
    final iconColor = Color(0xFF6535ee);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        centerTitle: true,
        backgroundColor: Color(0xFF6535ee),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ColoredDivider(color: dividerColor), // Line before the first tile
          SizedBox(height: 30),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50'),
          ),
          SizedBox(height: 20),
          Text(
            'Hey there, Sharad!',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 40),
          ColoredDivider(color: dividerColor), // Line before "Edit Profile" tile
          ListTile(
            leading: Icon(Icons.person, color: iconColor), // Change only the icon color
            title: Text('Edit Profile'), // Keep text color as is
            trailing: Icon(Icons.arrow_forward_ios, color: iconColor), // Change only the icon color
            onTap: () {
              // Navigate to Edit Profile page
            },
          ),
          ColoredDivider(color: dividerColor), // Line after "Edit Profile" tile
          ListTile(
            leading: Icon(Icons.settings, color: iconColor), // Change only the icon color
            title: Text('Settings'), // Keep text color as is
            trailing: Icon(Icons.arrow_forward_ios, color: iconColor), // Change only the icon color
            onTap: () {
              // Navigate to Settings page
            },
          ),
          ColoredDivider(color: dividerColor), // Colored divider between tiles
          ListTile(
            leading: Icon(Icons.warning, color: iconColor), // Change only the icon color
            title: Text('SoS Click'), // Keep text color as is
            trailing: Icon(Icons.arrow_forward_ios, color: iconColor), // Change only the icon color
            onTap: () {
              // Navigate to Help & Support page
            },
          ),
          ColoredDivider(color: dividerColor), // Colored divider between tiles
          ListTile(
            leading: Icon(Icons.logout, color: iconColor), // Change only the icon color
            title: Text('Log out'), // Keep text color as is
            onTap: () {
              // Log out user
            },
          ),
          ColoredDivider(color: dividerColor), // Line after "Log out" tile
        ],
      ),
    );
  }
}




