
import 'package:first_try_signup/AdminInterface/HachthoneInfoPage/HAchPageCards.dart';
import 'package:first_try_signup/AdminInterface/HomePage/homepage.dart';
import 'package:first_try_signup/AdminInterface/MyHachathones/FinalCards.dart';
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

class Hachthonepage extends StatefulWidget {
  const Hachthonepage({super.key});

  @override
  State<Hachthonepage> createState() => _HachthonepageState();
}

class _HachthonepageState extends State<Hachthonepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.primary,
      appBar: CustomAppBar(),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //// hack photo 
              HackImageBox(color: const Color.fromARGB(255, 206, 224, 239), ),
          
              ////title box
              Title_Box("Hachathone Name"), 
          
              HackathonTimeline(
            startDate: '25/12/2024',
            endDate: '26/12/2024',
            location: 'Online',
          ),
          
          
          
          //////
            TopicCard(
              topicDescription: 'BLA BLA BLA BLA ........',
              tags: ['Machine Learning', 'AI', 'Data Science'],
            ),



            ///// skills section 
            SkillsSection(
                 title: 'Skills Needed',
                 skills: ['Flutter', 'Dart', 'UI Design'],
            ),

            DescriptionSection(
              descriptionText: "hello this hackathone is about ai ......................................................................................... ",
              title: "Description",
              icon: Icons.description,
            ),

  
          /////// sponsor 
         SponsorSection(
          title: "Sponsored By",
          height: 204, // Height of the sponsor list container
          itemCount: 5, // Number of sponsors to display
          names: ['Company 1', 'Company 2', 'Company 3', 'Company 4', 'Company 5'],
          colors: Colors.primaries, // Background colors for each sponsor
            ),
         

         ////organizer
         Container(
          margin: EdgeInsets.only(left: 13, top: 25),
          child: OrganizerSection(sectionTitle: "Organizers", sectionIcon: Icons.edit, avatarNames: ["name", "name", "name" , "name", "name","name", "name"], avatarColors: [const Color.fromARGB(255, 75, 4, 85), const Color.fromARGB(255, 8, 8, 205), const Color.fromARGB(255, 232, 99, 4), const Color.fromARGB(255, 174, 33, 33), const Color.fromARGB(255, 27, 176, 25), const Color.fromARGB(255, 207, 29, 29), Colors.white])),
          /////
          Container(
            margin: EdgeInsets.only(left: 27, top: 25, bottom: 10),
            child: SizedBox(
              width: 470,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleOfSection(title:" Schedule " , icon: Icons.calendar_today),
                   DaySelector(),
                ],
              ),
            ),
          ),
          //////// agenda          
           Center(
  child: ConstrainedBox(
    constraints: BoxConstraints(maxWidth: 430), // Adjust maxWidth as needed
    child: ListView.builder(
      shrinkWrap: true, // Ensure ListView doesn't take up infinite space
      physics: const NeverScrollableScrollPhysics(), // Prevent internal scrolling
      itemCount: 5,
      itemBuilder: (context, index) {
        return CircleWithAgenda(
                  eventName: agendaData[index]['eventName'] ?? '',
                  eventTime: agendaData[index]['eventTime'] ?? '',
                  isFirst: index == 0,
                  isLast: index == agendaData.length - 1,
                );
      },
    ),
  ),
),
        

            
             
        //////////
        
            ],
          ),
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