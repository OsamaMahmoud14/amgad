import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class uploadForm extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  uploadForm({
    required this.videoFile,
    required this.videoPath
});

  @override
  State<uploadForm> createState() => _uploadFormState();
}

class _uploadFormState extends State<uploadForm> {

  VideoPlayerController ?playerController;
  @override
  void initState() {
    super.initState();

    setState(() {
      playerController = VideoPlayerController.file(widget.videoFile);
    });
    playerController!.initialize();
    playerController!.play();
    playerController!.setVolume(2);
    playerController!.setLooping(true);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    playerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/1.2,
            child: VideoPlayer(playerController!),

          ),
          const SizedBox(
            height: 30,
          ),
          // upload Now button
          // Circular progress bar
          //input fields


          InkWell(
            onTap: (){

            },
            child: Center(
              child: Text(
                "Upload Now",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
