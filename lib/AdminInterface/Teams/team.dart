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

class teampage extends StatefulWidget {
  const teampage({super.key});

  @override
  State<teampage> createState() => _teampageState();
}

class _teampageState extends State<teampage> {
  final ImagePicker _picker = ImagePicker();
  List<Map<String, dynamic>> teams = [];
  String currentTab = 'Teams';

  void _showTeamDialog() {
    String teamName = '';
    int participantCount = 0;
    List<Map<String, dynamic>> participants = [];

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text(
                'Create Team',
                style: TextStyle(color: AppColors.primary),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: 'Team Name'),
                    onChanged: (value) {
                      teamName = value;
                    },
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(hintText: 'Number of Participants'),
                    onChanged: (value) {
                      participantCount = int.tryParse(value) ?? 0;
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _showParticipantDialog(
                      teamName,
                      participantCount,
                      participants,
                    );
                  },
                  child: Text('Add Participants'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showParticipantDialog(String teamName, int participantCount,
      List<Map<String, dynamic>> participants) {
    int currentIndex = 0;

    void addParticipant(String name, String role, XFile? image) {
      participants.add({'name': name, 'role': role, 'image': image});
    }

    void nextParticipantDialog() {
      if (currentIndex < participantCount) {
        String name = '';
        String role = '';
        XFile? image;

        showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setDialogState) {
                return AlertDialog(
                  title: Text('Participant ${currentIndex + 1}'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(hintText: 'Name'),
                        onChanged: (value) => name = value,
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: 'Role'),
                        onChanged: (value) => role = value,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final XFile? pickedFile = await _picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          setDialogState(() {
                            image = pickedFile;
                          });
                        },
                        child: Text('Pick Photo (Optional)'),
                      ),
                      if (image != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.file(
                            File(image!.path),
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
                        addParticipant(name, role, image);
                        Navigator.pop(context);
                        currentIndex++;
                        nextParticipantDialog();
                      },
                      child: Text('Next'),
                    ),
                  ],
                );
              },
            );
          },
        );
      } else {
        setState(() {
          teams.add({'teamName': teamName, 'participants': participants});
        });
      }
    }

    nextParticipantDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SizedBox(height: 20),
          Stack(
            children: [
              // Texte avec bordure noire
              Text(
                'Team Management',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke // Contour seulement
                    ..strokeWidth = 2.5 // Épaisseur de la bordure
                    ..color = Colors.black, // Couleur de la bordure
                ),
              ),
              // Texte blanc à l'intérieur
              Text(
                'Team Management',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Couleur intérieure des lettres
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentTab = 'Teams';
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 9,
                  backgroundColor: currentTab == 'Teams'
                      ? Colors.yellow
                      : const Color.fromARGB(255, 99, 72, 162),
                ),
                child: const Text(
                  'Teams',
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
                    currentTab = 'Individual';
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 9,
                  backgroundColor: currentTab == 'Individual'
                      ? Colors.yellow
                      : const Color.fromARGB(255, 99, 72, 162),
                ),
                child: const Text(
                  'Individual',
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
            child: ListView.builder(
              padding: EdgeInsets.all(25),
              itemCount: currentTab == 'Teams' 
                  ? teams.length 
                  : teams.expand((team) => team['participants']).toList().length,
              itemBuilder: (context, index) {
                if (currentTab == 'Teams') {
                  // Display teams with participants
                  final team = teams[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white.withOpacity(0.4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 15),
                          child: Stack(
                            children: [
                              // Text with border
                              Text(
                                team['teamName'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 2.5
                                    ..color = Colors.black,
                                ),
                              ),
                              // Text inside
                              Text(
                                team['teamName'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              team['participants'].length,
                              (participantIndex) {
                                final participant = team['participants'][participantIndex];
                                return Padding(
                                  padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                                  child: Column(
                                    children: [
                                      participant['image'] != null
                                          ? CircleAvatar(
                                              backgroundImage: FileImage(File(participant['image'].path)),
                                              radius: 30,
                                            )
                                          : CircleAvatar(
                                              radius: 30,
                                              child: Icon(Icons.person),
                                            ),
                                      SizedBox(height: 5),
                                      Text(participant['name'],  style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),),
                                      Text(participant['role'], style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                 // Display individual participants without teams
                  final participant = teams.expand((team) => team['participants']).toList()[index];
                  return Container(
  margin: EdgeInsets.symmetric(vertical: 10), // Adjust vertical margin
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // First Card
      SizedBox(
        width: 150,  // Fixed width for each card
        height: 200, // Fixed height for each card
        child: Card(
            color: Colors.white.withOpacity(0.4),

          margin: EdgeInsets.symmetric(horizontal: 10), // Horizontal margin between cards
          child: Padding(
            
            padding: const EdgeInsets.all(8.0), // Padding inside the card
            child: Column(
               
              mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
              crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
              children: [
                participant['image'] != null
                    ? CircleAvatar(
                        backgroundImage: FileImage(File(participant['image'].path)),
                        radius: 40,
                      )
                    : CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.person, size: 40),
                      ),
                SizedBox(height: 5),
                Text(participant['name'], textAlign: TextAlign.center,
                 style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),),
                Text(participant['role'], textAlign: TextAlign.center,
                 style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),),
              ],
            ),
          ),
        ),
      ),
      // Second Card
      SizedBox(
        width: 150,  // Fixed width for each card
        height: 200, // Fixed height for each card
        child: Card(
            color: Colors.white.withOpacity(0.4),

          margin: EdgeInsets.symmetric(horizontal: 10), // Horizontal margin between cards
          child: Padding(
            padding: const EdgeInsets.all(8.0), // Padding inside the card
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
              crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
              children: [
                participant['image'] != null
                    ? CircleAvatar(
                        backgroundImage: FileImage(File(participant['image'].path)),
                        radius: 40,
                      )
                    : CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.person, size: 40),
                      ),
                SizedBox(height: 5),
                Text(participant['name'], textAlign: TextAlign.center,  
                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                ),
                Text(participant['role'], textAlign: TextAlign.center,
                 style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),),
              ],
            ),
          ),
        ),
      ),
    ],
  ),
);

                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showTeamDialog,
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add),
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
