import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SponsoredByWidget extends StatefulWidget {
  @override
  _SponsoredByWidgetState createState() => _SponsoredByWidgetState();
}

class _SponsoredByWidgetState extends State<SponsoredByWidget> {
  List<File?> images = []; // List to store selected images

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        debugPrint("Image picked: ${pickedFile.path}");
        setState(() {
          images.add(File(pickedFile.path));
        });
      } else {
        debugPrint("No image selected.");
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          
        ),
        SizedBox(
          height: 80, // Set a fixed height for the row of circles
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                // Add button
                return GestureDetector(
                  onTap: _pickImage,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.yellow,
                      child: Icon(Icons.add, size: 30, color: Colors.white),
                    ),
                  ),
                );
              } else {
                // Display selected images
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: FileImage(images[index - 1]!),
                    backgroundColor: Colors.white,
                  ),
                );
              }
            },
          ),
        ),
        
      ],
    );
  }
}
