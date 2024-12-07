import 'package:first_try_signup/AdminInterface/CreateHack/create_event_page.dart';
import 'package:first_try_signup/AdminInterface/CreateHack/participants_information.dart';
import 'package:first_try_signup/AdminInterface/HomePage/homepage.dart';
import 'package:first_try_signup/AdminInterface/MyCreatedHackathone/my_created_hackathons.dart';
import 'package:first_try_signup/AdminInterface/MyHachathones/MyHachathons.dart';
import 'package:first_try_signup/AdminInterface/Profile/profileorg.dart';
import 'package:first_try_signup/Style/Douaa-Style/colors.dart';
import 'package:first_try_signup/Style/Douaa-Style/style.dart';
import 'package:first_try_signup/Style/Style_Meriem/styles.dart';
import 'package:first_try_signup/Style/Style_sarab/themes.dart';

import 'package:flutter/material.dart';


class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _Schedule();
}

class _Schedule extends State<Schedule> {
  final List<Map<String, TextEditingController>> _scheduleItems = [];

  @override
  void initState() {
    super.initState();
    _addScheduleItem(); // Add the first container by default
  }
  void _addScheduleItem() {
    setState(() {
      _scheduleItems.add({
        'task': TextEditingController(),
        'startTime': TextEditingController(),
        'endTime': TextEditingController(),
        'place': TextEditingController(),
      });
    });
  }
  
  void _validateSchedules() {
    for (var item in _scheduleItems) {
      final task = item['task']!.text;
      final startTime = item['startTime']!.text;
      final endTime = item['endTime']!.text;
      final place = item['place']!.text;

      if (task.isEmpty || startTime.isEmpty || endTime.isEmpty || place.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please fill in all fields.")),
        );
        return;
      }

      if (startTime.compareTo(endTime) >= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Start time must be before end time.")),
        );
        return;
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("All schedules are valid!")),
    );
  }

  void _validateAndNavigate() {
    for (var item in _scheduleItems) {
      final task = item['task']!.text;
      final startTime = item['startTime']!.text;
      final endTime = item['endTime']!.text;
      final place = item['place']!.text;

      if (task.isEmpty || startTime.isEmpty || endTime.isEmpty || place.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please fill in all fields.")),
        );
        return;
      }

      if (startTime.compareTo(endTime) >= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Start time must be before end time.")),
        );
        return;
      }
    }

    // Navigate to the next page (replace `NextPage` with your actual widget)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const participants_infopage(), // Replace with your next screen
      ),
    );
  }




  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          decoration: backColor,
          constraints: BoxConstraints(
          minHeight: 730.0, // Initial height
        ),
          child: Column(
            children: [
              //the title 
              SizedBox(height: 50,),
              Text(
                "schedule" , 
                style: TextStyle(
                      fontSize: 24 , 
                      color: Colors.white , 
                      fontWeight: FontWeight.bold , 
                ),

                

              ) , 
              SizedBox(height: 45,),
              //the container 
              Container(
                width: 400,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                   color: Color.fromARGB(149, 189, 120, 241),
                 ),
                 child: Column(
                   children: [
                    SizedBox(height: 25,),
                          ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _scheduleItems.length,
                itemBuilder: (context, index) {
                  final item = _scheduleItems[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        TextField(
                          controller: item['task'],
                          decoration: InputDecoration(
                            labelText: "What to do",
                            labelStyle: const TextStyle(color: smallTitlesColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              
                            ),
                           
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: item['startTime'],
                                decoration: InputDecoration(
                                  labelText: "Start Time",
                                  labelStyle: const TextStyle(color:  smallTitlesColor),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: item['endTime'],
                                decoration: InputDecoration(
                                  labelText: "End Time",
                                  labelStyle: const TextStyle(color:  smallTitlesColor),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: item['place'],
                          decoration: InputDecoration(
                            labelText: "Place",
                            labelStyle: const TextStyle(color:  smallTitlesColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),

                          const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _addScheduleItem,
                    icon: const Icon(Icons.add),
                    label: const Text("Add Schedule"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: midTitlesColor,
                      foregroundColor: smallTitlesColor,
                    ),
                  ),
                  const SizedBox(width: 20),
                  
                ],
              ),
                      ],
                    ),
                  );
                },
              ),

              //icon button
              Container(
                margin: EdgeInsets.only(left: 270),
                child: IconButton(
                onPressed: _validateAndNavigate,
                 icon: Icon(Icons.next_plan_rounded , size: 45,) , 
                 color: Colors.white,
                 ) ,
              ) ,
              
                   ],
                 ),
              ), 
              
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
            icon: Icon(Icons.event, color: Colors.white, size: 30.0),
            onPressed: () {
               Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateEvent()),
                    );
              
            },
          ),
          
          IconButton(
            icon: Icon(Icons.event, color: Colors.white, size: 30.0),
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
