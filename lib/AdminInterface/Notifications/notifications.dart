import 'package:first_try_signup/AdminInterface/CreateHack/create_event_page.dart';
import 'package:first_try_signup/AdminInterface/HomePage/homepage.dart';
import 'package:first_try_signup/AdminInterface/MyCreatedHackathone/my_created_hackathons.dart';
import 'package:first_try_signup/AdminInterface/MyHachathones/MyHachathons.dart';
import 'package:first_try_signup/AdminInterface/Profile/profileorg.dart';
import 'package:first_try_signup/Style/Style_sarab/themes.dart';
import 'package:flutter/material.dart';
import 'package:first_try_signup/Style/Style_Meriem/styles.dart';

class notificationspage extends StatefulWidget {
  const notificationspage({super.key});

  @override
  State<notificationspage> createState() => _notificationspageState();
}

class _notificationspageState extends State<notificationspage> {
  final List<Map<String, String>> notifications = [
    {'message': 'You have been accepted in Hilly Hackathon', 'time': '2 hours ago'},
    {'message': 'New message from the event organizer', 'time': '4 hours ago'},
    {'message': 'Your team has been updated!', 'time': '1 day ago'},
    {'message': 'Reminder: Submit your project before midnight', 'time': '3 days ago'},
    {'message': 'You have been accepted in Hilly Hackathon', 'time': '2 hours ago'},
    {'message': 'You have been accepted in Hilly Hackathon', 'time': '2 hours ago'},
    {'message': 'You have been accepted in Hilly Hackathon', 'time': '2 hours ago'},
    {'message': 'You have been accepted in Hilly Hackathon', 'time': '2 hours ago'},
    {'message': 'You have been accepted in Hilly Hackathon', 'time': '2 hours ago'},
    {'message': 'You have been accepted in Hilly Hackathon', 'time': '2 hours ago'},
    {'message': 'You have been accepted in Hilly Hackathon', 'time': '2 hours ago'},
    {'message': 'You have been accepted in Hilly Hackathon', 'time': '2 hours ago'},
    {'message': 'You have been accepted in Hilly Hackathon', 'time': '2 hours ago'},

    // Add more notifications as needed
  ];

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
              Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.5
                    ..color = Colors.black,
                ),
              ),
              Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container()),
              TextButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(elevation: 9),
                child: const Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
           SizedBox(width: 50),
         
          Expanded(
            child: ListView.builder(
              
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailPage(),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.white.withOpacity(0.4),
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                           SizedBox(width: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'assets/profile.jpg',
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.width * 0.15,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 20),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notification['message']!,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  notification['time']!,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
             SizedBox(width: 50),
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

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: const Text(
          'This is the detail page.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
