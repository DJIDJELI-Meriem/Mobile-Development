// ignore_for_file: prefer_const_constructors

import 'package:first_try_signup/AdminInterface/HomePage/homepage.dart';
import 'package:first_try_signup/Style/Style_sarab/themes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:first_try_signup/Style/Style_Meriem/styles.dart';
import 'package:first_try_signup/AdminInterface/CreateHack/create_event_page.dart';
import 'package:first_try_signup/AdminInterface/HachthoneInfoPage/HachthonePage.dart';
import 'package:first_try_signup/AdminInterface/MyHachathones/MyHachathons.dart';
import 'package:first_try_signup/AdminInterface/Profile/profileorg.dart';
import 'package:first_try_signup/AdminInterface/MyCreatedHackathone/my_created_hackathons.dart';
import 'package:flutter/material.dart';
import 'package:first_try_signup/Style/Style_Meriem/styles.dart';


class participantspage extends StatefulWidget {
  const participantspage({super.key});

  @override
  State<participantspage> createState() => _participantspageState();
}

class _participantspageState extends State<participantspage> {
  List<Map<String, dynamic>> cards = []; // List to hold cards with metadata
  final ImagePicker _picker = ImagePicker();
  String currentTab = 'Waiting'; // Track which tab is active

  // Function to show dialog for name, role, and optional photo
  void _showDialog() {
    String name = '';
    String role = '';
    XFile? image;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setDialogState) {
            return AlertDialog(
              title: Text('Enter Participant Details',
              style: TextStyle(
                color: AppColors.primary,
              ),
      
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: InputDecoration(hintText: 'Name'),
                  ),
                  TextField(
                    onChanged: (value) {
                      role = value;
                    },
                    decoration: InputDecoration(hintText: 'Role'),
                  ),
                  SizedBox(height: 20),
                 
                        ElevatedButton(
                         style: ElevatedButton.styleFrom(
                  elevation: 9,
                  backgroundColor: currentTab == 'Waiting'
                      ? AppColors.primary
                      : const Color.fromARGB(255, 99, 72, 162),
                ),
                    onPressed: () async {
                      final XFile? pickedFile = await _picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      setDialogState(() {
                        image = pickedFile;
                      });
                    },
                    child: Text('Pick a Photo (Optional)',
                     style: TextStyle(
                color: Colors.white,
              ),),
                  ),
                  
              
                  if (image != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.file(
                        File(image?.path ?? ''),
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
              actions: [
                TextButton(
                 
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (name.isNotEmpty && role.isNotEmpty) {
                      setState(() {
                        cards.add({
                          'name': name,
                          'role': role,
                          'image': image,
                          'status': 'Waiting'
                        });
                      });
                    }
                  },
                  child: Text('Add Participant',
                   style: TextStyle(
                color: AppColors.primary,
              ),),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Participants',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentTab = 'Waiting';
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 9,
                  backgroundColor: currentTab == 'Waiting'
                      ? Colors.yellow
                      : const Color.fromARGB(255, 99, 72, 162),
                ),
                child: const Text(
                  'Waiting',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
              SizedBox(width: 120),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentTab = 'Accepted';
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 9,
                  backgroundColor: currentTab == 'Accepted'
                      ? Colors.yellow
                      : const Color.fromARGB(255, 99, 72, 162),
                ),
                child: const Text(
                  'Accepted',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
  child: GridView.builder(
    padding: EdgeInsets.all(40),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Maximum 2 cards per row
      crossAxisSpacing: 30,
      mainAxisSpacing: 20, // Adjust space between rows
      childAspectRatio: 3 / 4, // Card aspect ratio
    ),
    itemCount: cards.where((card) => card['status'] == currentTab).length,
    itemBuilder: (context, index) {
      final visibleCards = cards.where((card) => card['status'] == currentTab).toList();
      final card = visibleCards[index]; // Get only relevant cards

      return Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white.withOpacity(0.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            card['image'] != null
                ? CircleAvatar(
                    backgroundImage: FileImage(File(card['image'].path)),
                    radius: 50,
                  )
                : Icon(Icons.account_circle, size: 100, color: Colors.grey),
            SizedBox(height: 10),
            Text(
              card['name'],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              card['role'],
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            if (currentTab == 'Waiting') ...[
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Container(
  width: 50.0, // Set the width of the container
  height: 50.0, // Set the height of the container
  decoration: BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle, // This makes the container circular
  ),
  child: IconButton(
    onPressed: () {
      setState(() {
        card['status'] = 'Accepted';
      });
    },
    icon: Icon(Icons.check, color: Colors.green),
  ),
),
SizedBox(width: 20),
Container(
   width: 50.0, // Set the width of the container
  height: 50.0, // Set the height of the container
  decoration: BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle, // This makes the container circular
  ),
  child:  IconButton(
                    onPressed: () {
                      setState(() {
                        cards.remove(card);
                      });
                    },
                    icon: Icon(Icons.close, color: Colors.red),
                  ),
),

                 
                ],
              ),
            ],
          ],
        ),
      );
    },
  ),
),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        backgroundColor: Colors.yellow,
        child: Icon(Icons.add),
      ),
       bottomNavigationBar: ClipRRect(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(0.0),
    topRight: Radius.circular(0.0),
  ),
  child: Container(
color: AppColors.primary,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.white, size: 30.0),
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>HomeScreen()),
                    );
            },
          ),
         
       
      
          IconButton(
            icon: Icon(Icons.event, color: Colors.white, size: 30.0),
            onPressed: () {
               Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Myhachathons()),
                    );
              
            },
          ),
             IconButton(
            icon: Icon(Icons.add, color: Colors.white, size: 30.0),
            onPressed: () {
               Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateEvent()),
                    );
              
            },
          ),
          
          IconButton(
            icon: Icon(Icons.check, color: Colors.white, size: 30.0),
            onPressed: () {
               Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => mycreatedhackathons()),
                    );
              
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.white, size: 30.0),
            onPressed: () {
               Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profileorg()),
                    );
              
            },
          ),
        ],
      ),
    ),
  ),
),
    );
  }
}
