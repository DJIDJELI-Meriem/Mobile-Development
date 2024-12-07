// ignore_for_file: non_constant_identifier_names

import 'package:first_try_signup/AdminInterface/HachthoneInfoPage/HachthonePage.dart';
import 'package:first_try_signup/AdminInterface/Participants/participants.dart';
import 'package:first_try_signup/AdminInterface/Teams/team.dart';
import 'package:flutter/material.dart';



// Title Box Widget
Widget Title_Box(String Title) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Text(
          Title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255)),
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}



// Hackathon Information Model
class HackathonInfo {
  final String title;
  final String owner;
  final String date;
  final String place;
  final String imageUrl; // The image URL to pass the photo
  final int iconNumber; // 0 = no icon, 1, 2, or 3 = different icons

  HackathonInfo({
    required this.title,
    required this.owner,
    required this.date,
    required this.place,
    required this.imageUrl, // Make sure imageUrl is passed as a parameter
    required this.iconNumber,
  });
}

// Hackathon Card Widget
class HackathonCard extends StatelessWidget {
  final HackathonInfo info;

  const HackathonCard({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to another page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Hachthonepage(), // Your destination page
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main Card
          Card(
            color: const Color.fromARGB(88, 156, 174, 212),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                // Left Part (Titles)
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          info.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          info.owner,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              info.date,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 50, 50, 50),
                              ),
                            ),
                            Text(
                              info.place,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Right Part (Image)
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    child: Image.network(
                      info.imageUrl, // The image URL is used here
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Circle with Icon (only if iconNumber is not 0)
          if (info.iconNumber != 0)
            Positioned(
              top: 60,
              right: -20, // Positioned to extend half outside the card
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    _getIconForNumber(info.iconNumber),
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Function to get the appropriate icon based on the number
  IconData _getIconForNumber(int number) {
    switch (number) {
      case 1:
        return Icons.looks_one; // Icon for number 1
      case 2:
        return Icons.looks_two; // Icon for number 2
      case 3:
        return Icons.looks_3; // Icon for number 3
      default:
        return Icons.star; // Fallback icon
    }
  }
}

// Hackathon List View Widget
class HackathonListView extends StatelessWidget {
  final List<HackathonInfo> hackathonList;

  const HackathonListView({Key? key, required this.hackathonList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hackathonList.length, // Number of hackathons
      itemBuilder: (context, index) {
        final hackathon = hackathonList[index]; // Get the specific hackathon at the current index
        return Padding(
          padding: const EdgeInsets.all(8.0), // Add padding between cards
          child: HackathonCard(info: hackathon), // Render HackathonCard with the current info
        );
      },
    );
  }
}
























///////////////////// ADMIN CARDS //////////////////
class HackathonCardAdmin extends StatelessWidget {
  final HackathonInfo info;

  const HackathonCardAdmin({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Main Card
        Card(
          color: const Color.fromARGB(88, 156, 174, 212),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  // Left Part (Titles)
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            info.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${info.owner} (Admin)', // Add "Admin" to the owner's name
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                info.date,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 50, 50, 50),
                                ),
                              ),
                              Text(
                                info.place,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Right Part (Image)
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      child: Image.network(
                        info.imageUrl, // The image URL is used here
                        fit: BoxFit.cover,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.white54,
                thickness: 1,
                height: 16,
                indent: 16,
                endIndent: 16,
              ),
              // Buttons Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Action for Participants button
                        debugPrint("Participants button clicked for ${info.title}");

                         // Navigate to the new page
                        Navigator.push(
                           context,
                        MaterialPageRoute(builder: (context) => participantspage()), // Replace NewPage with your page widget
    );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 26, 9, 102), // Button background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Participants',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Action for Teams button
                        debugPrint("Teams button clicked for ${info.title}");

                        // Navigate to the new page
                        Navigator.push(
                           context,
                        MaterialPageRoute(builder: (context) => teampage()),);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 30, 16, 94), // Button background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Teams',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Circle with Icon (only if iconNumber is not 0)
        if (info.iconNumber != 0)
          Positioned(
            top: 60,
            right: -20, // Positioned to extend half outside the card
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: Icon(
                  _getIconForNumber(info.iconNumber),
                  color: Colors.purple,
                ),
              ),
            ),
          ),
      ],
    );
  }

  // Function to get the appropriate icon based on the number
  IconData _getIconForNumber(int number) {
    switch (number) {
      case 1:
        return Icons.looks_one; // Icon for number 1
      case 2:
        return Icons.looks_two; // Icon for number 2
      case 3:
        return Icons.looks_3; // Icon for number 3
      default:
        return Icons.star; // Fallback icon
    }
  }
}




