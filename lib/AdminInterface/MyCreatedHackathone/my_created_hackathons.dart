// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:first_try_signup/AdminInterface/HomePage/homepage.dart';
import 'package:first_try_signup/AdminInterface/Participants/participants.dart';
import 'package:first_try_signup/AdminInterface/Profile/profileorg.dart';
import 'package:first_try_signup/AdminInterface/Teams/team.dart';
import 'package:first_try_signup/Style/Style_sarab/themes.dart';
import 'package:flutter/material.dart';
import 'package:first_try_signup/Style/Style_Meriem/styles.dart';
import 'package:first_try_signup/AdminInterface/CreateHack/create_event_page.dart';
import 'package:first_try_signup/AdminInterface/HachthoneInfoPage/HachthonePage.dart';
import 'package:first_try_signup/AdminInterface/MyHachathones/MyHachathons.dart';
import 'package:first_try_signup/AdminInterface/Profile/profileorg.dart';
import 'package:first_try_signup/AdminInterface/MyCreatedHackathone/my_created_hackathons.dart';
import 'package:flutter/material.dart';
import 'package:first_try_signup/Style/Style_Meriem/styles.dart';

class mycreatedhackathons extends StatefulWidget {
  const mycreatedhackathons({super.key});

  @override
  State<mycreatedhackathons> createState() => _mycreatedhackathonsState();
}

class _mycreatedhackathonsState extends State<mycreatedhackathons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary, // Couleur de fond violet
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'My Created Hackathons',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          
          SizedBox(height: 20),
          // Barre de recherche
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.white),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white60),
                    ),
                  ),
                ),
              ],
            ),
          ),
         
          SizedBox(height: 40),
          // Grille des hackathons
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Nombre de colonnes
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8, // Proportions des cartes
                ),
                itemCount: 4, // Nombre de hackathons
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white.withOpacity(0.2),
                    elevation: 5,
                    child: Stack(
                      children: [
                        // Textes alignés en haut à gauche
                        Positioned(
                          top: 15,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  // Texte avec bordure noire
                                  Text(
                                    'Hack Name',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..style = PaintingStyle
                                            .stroke // Contour seulement
                                        ..strokeWidth =
                                            2.5 // Épaisseur de la bordure
                                        ..color = Colors
                                            .black, // Couleur de la bordure
                                    ),
                                  ),
                                  // Texte blanc à l'intérieur
                                  Text(
                                    'Hack Name',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .white, // Couleur intérieure des lettres
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  // Texte avec bordure noire
                                  Text(
                                    'Field',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..style = PaintingStyle
                                            .stroke // Contour seulement
                                        ..strokeWidth =
                                            2.5 // Épaisseur de la bordure
                                        ..color = Colors
                                            .black, // Couleur de la bordure
                                    ),
                                  ),
                                  // Texte blanc à l'intérieur
                                  Text(
                                    'Field',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .yellow, // Couleur intérieure des lettres
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  // Texte avec bordure noire
                                  Text(
                                    'Topic',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..style = PaintingStyle
                                            .stroke // Contour seulement
                                        ..strokeWidth =
                                            2.5 // Épaisseur de la bordure
                                        ..color = Colors
                                            .black, // Couleur de la bordure
                                    ),
                                  ),
                                  // Texte blanc à l'intérieur
                                  Text(
                                    'Topic',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .yellow, // Couleur intérieure des lettres
                                    ),
                                  ),
          
         

          Column(
          
            children: [
              SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              
              ElevatedButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
    minimumSize: MaterialStateProperty.all<Size>(Size(80, 30)), // Width: 80, Height: 30
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => teampage()),
    );
  },
  child: const Text(
    'Teams',
    style: TextStyle(
      color: Color.fromARGB(255, 5, 5, 5),
      fontSize: 10, 
      fontWeight: FontWeight.bold
    ),
  ),
),
SizedBox(width: 10),
ElevatedButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
    minimumSize: MaterialStateProperty.all<Size>(Size(90, 30)), // Width: 100, Height: 30
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => participantspage()),
    );
  },
  child: const Text(
    'Participants',
    style: TextStyle(
      color: Color.fromARGB(255, 17, 17, 17),
      fontSize: 10,
      fontWeight: FontWeight.bold
    ),
  ),
),

                ],
              ),
            ],
          ),

                                ],
                              ),
                            ],
                          ),
                        ),
                        // Image alignée en bas à droite
                       Positioned(
  bottom: 30,
  right: 20,
  child: ClipRRect(
    borderRadius: BorderRadius.circular(20), // Ajustez le rayon selon vos besoins
    child: Image.asset(
      'assets/profile.jpg', // Assurez-vous que cette image existe
      height: 100,
      width: 100,
      fit: BoxFit.cover,
    ),
  ),
),

                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
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
