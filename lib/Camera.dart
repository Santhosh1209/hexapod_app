import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AdminCamera extends StatefulWidget {
  @override
  _AdminCameraState createState() => _AdminCameraState();
}

class _AdminCameraState extends State<AdminCamera> {
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    // Initialize the YouTube player controller with your video URL
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: 'IAX3vwjZ4m4',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hexapod Camera'),
        centerTitle: true, // Center the title
        backgroundColor: Color(0xFF6535EE), // Set AppBar background color to #6535EE
      ),
      body: Column(
        children: [
          // YouTube Video Player
          YoutubePlayer(
            controller: _youtubePlayerController,
            showVideoProgressIndicator: true,
            onReady: () {
              // You can perform actions when the video is ready
            },
          ),
          // Buttons for Taking Photos and Videos
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add functionality to take photos
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF6535EE), // Button color
                ),
                child: Text(
                  'Take Photo',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add functionality to take videos
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF6535EE), // Button color
                ),
                child: Text(
                  'Take Video',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Expanded(
            child: WebView(
              initialUrl: 'https://sandcastle.cesium.com/?src=Clamp%20to%203D%20Tiles.html', // Replace with the actual file path or URL of your CesiumJS scene
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
          // Rest of the camera content
        ],
      ),
    );
  }

  void dispose() {
    _youtubePlayerController.dispose(); // Dispose of the YouTube player controller
    super.dispose();
  }
}
