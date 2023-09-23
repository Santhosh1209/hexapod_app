import 'package:flutter/material.dart';
class AnnouncementsPage extends StatelessWidget {
  // Sample announcements data
  final List<Map<String, dynamic>> announcements = [
    {
      'title': 'Important Announcement 1',
      'content': 'This is the content of Announcement 1. Please read it carefully.',
      'icon': Icons.info,
    },
    {
      'title': 'Upcoming Event',
      'content': 'Join us for the upcoming event on October 15th at 5:00 PM.',
      'icon': Icons.event,
    },
    {
      'title': 'New Feature Added',
      'content': 'We have added exciting new features to our app. Check them out!',
      'icon': Icons.new_releases,
    },
    // Add more announcements as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements'),
        backgroundColor: Color(0xFF6535ee),
      ),
      body: ListView.builder(
        itemCount: announcements.length,
        itemBuilder: (BuildContext context, int index) {
          final announcement = announcements[index];
          final title = announcement['title'];
          final content = announcement['content'];
          final icon = announcement['icon'];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            elevation: 2.0,
            child: ListTile(
              leading: Icon(icon), // Display the icon
              title: Text(title), // Display the title
              subtitle: Text(content), // Display the content
            ),
          );
        },
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: AnnouncementsPage(),
));


