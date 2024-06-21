import 'dart:io';

import 'package:amgad/uploadForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({super.key});

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  getVideoFile(ImageSource sourceImg) async {
    final videoFile = await ImagePicker().pickVideo(source: sourceImg);
    if (videoFile != null) {
      Get.to(() => uploadForm(
        videoFile: File(videoFile.path),
        videoPath: videoFile.path,
      ));
    }
  }

  displayDialogBox() {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context);
              getVideoFile(ImageSource.gallery);
            },
            child: Row(
              children: [
                Icon(Icons.image),
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Get Video from Gallery",
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    )),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context);
              getVideoFile(ImageSource.camera);
            },
            child: Row(
              children: [
                Icon(Icons.camera),
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Make Video With Phone Camera",
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
                onPressed: () {
                  displayDialogBox();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text(
                  "Upload New Video",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
