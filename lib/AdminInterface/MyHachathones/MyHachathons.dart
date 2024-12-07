import 'package:first_try_signup/AdminInterface/HomePage/homepage.dart';
import 'package:first_try_signup/AdminInterface/MyHachathones/FinalCards.dart';
import 'package:first_try_signup/AdminInterface/MyHachathones/table_calender.dart';
import 'package:first_try_signup/Style/Style_Meriem/styles.dart';
import 'package:first_try_signup/Style/Style_sarab/themes.dart';
import 'package:first_try_signup/data/data.dart';
import 'package:flutter/material.dart';
import 'package:first_try_signup/AdminInterface/CreateHack/create_event_page.dart';
import 'package:first_try_signup/AdminInterface/HachthoneInfoPage/HachthonePage.dart';
import 'package:first_try_signup/AdminInterface/MyHachathones/MyHachathons.dart';
import 'package:first_try_signup/AdminInterface/Profile/profileorg.dart';
import 'package:first_try_signup/AdminInterface/MyCreatedHackathone/my_created_hackathons.dart';
import 'package:flutter/material.dart';
import 'package:first_try_signup/Style/Style_Meriem/styles.dart';

class Myhachathons extends StatefulWidget {
  const Myhachathons({super.key});

  @override
  State<Myhachathons> createState() => _MyhachathonsState();
}

class _MyhachathonsState extends State<Myhachathons> {
  String currentTab = 'Upcoming'; // Initialize currentTab to avoid null errors.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary, // Assuming AppColors.primary is defined in `styles.dart`
      appBar:CustomAppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title Box
            Title_Box("My Hackathons"),

            // Calendar Agenda
            SizedBox(
              height: 150,
              child: Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(122, 252, 253, 255), // Background color for the calendar
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CalendarAgenda(), // Assuming CalendarAgenda is a valid widget
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Buttons for Teams and Individual
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currentTab = 'Done';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 9,
                    backgroundColor: currentTab == 'Done'
                        ? Colors.yellow
                        : const Color.fromARGB(255, 99, 72, 162),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),

                /// second button
                const SizedBox(width: 20), // Reduced spacing for better alignment
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currentTab = 'Upcoming';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 9,
                    backgroundColor: currentTab == 'Upcoming'
                        ? Colors.yellow
                        : const Color.fromARGB(255, 99, 72, 162),
                  ),
                  child: const Text(
                    'Upcoming',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Added spacing for visual balance



            /////////////
            Expanded( child: ListView.builder(itemCount: hackathonList.length,itemBuilder: (context, index) {return Padding( padding: const EdgeInsets.all(8.0), child: HackathonCardAdmin(info: hackathonList[index]), ); },),),

        
          ],
        ),
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
