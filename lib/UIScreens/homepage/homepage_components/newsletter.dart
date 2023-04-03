import 'package:da22023/general_components/CTAbutton.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class NewsletterSection extends StatefulWidget {
  @override
  _NewsletterSectionState createState() => _NewsletterSectionState();
}

class _NewsletterSectionState extends State<NewsletterSection> {
  String _email = '';
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    // Create the video player controller
    VideoPlayerController videoPlayerController = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/WebAssets%2FNewsletterClip.mp4?alt=media&token=755850c4-47fa-4f0e-a4b1-b7c47bc29f3c');

    // Initialize the chewie controller
    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
      allowPlaybackSpeedChanging: false,
      allowFullScreen: false,
      allowMuting: false,
      showControls: false,
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Dispose the chewie controller to free up resources
    _chewieController?.dispose();
  }

  void _updateEmail(String value) {
    setState(() {
      _email = value;
    });
  }

  void _submitForm() {
    // You can add your logic here to submit the form
    print('Email submitted: $_email');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 80,
        ),
        child: Row(
          children: [
            // Show the video using the Chewie player
            Expanded(
              child: Chewie(
                controller: _chewieController!,
              ),
            ),
            SizedBox(width: 32.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SUBSCRIBE TO OUR NEWSLETTER',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Become a member!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    'Submit your email below to receive our new updates!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    width: 560,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your email address',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: _updateEmail,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  CTAButton(
                    onPressed: _submitForm,
                    text: 'Subscribe',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
