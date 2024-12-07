// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:first_try_signup/UserInterface/HachthoneInfoPage/HachthonePage.dart';
import 'package:first_try_signup/UserInterface/MyHachathones/MyHachathons.dart';
import 'package:first_try_signup/UserInterface/Profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:first_try_signup/Style/Style_Meriem/styles.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary, // Background color
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Search Bar
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                          color: Colors.white), // Text color when typing
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors
                            .primary, // Your primary color for the background
                        hintText: 'Search here',
                        hintStyle:
                            TextStyle(color: Colors.white70), // Hint text color
                        prefixIcon: Icon(Icons.search,
                            color:
                                Colors.white), // Add icon inside the TextField
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color:
                                Colors.white, // Set the border color to white
                            width: 1.0, // Adjust the border thickness
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors
                                .white, // White border when the field is not focused
                            width: 0.8,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors
                                .white, // White border when the field is focused
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.filter_list, color: AppColors.primary),
                  )
                ],
              ),
              const SizedBox(height: 20),
// Main Banner
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary,
                      Colors.white
                    ], // Define the gradient colors
                    begin: Alignment.centerLeft, // Start of the gradient (left)
                    end: Alignment.centerRight, // End of the gradient (right)
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Inno Hack",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "You will have the opportunity to participate in hackathons. Create hackathons.",
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primary,
                      ),
                      onPressed: () {  },
                      child: Text("TRY NOW"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      AppColors.primary
                    ], // Define the gradient colors
                    begin: Alignment.centerLeft, // Start of the gradient (left)
                    end: Alignment.centerRight, // End of the gradient (right)
                  ),
                ),
                child: Text(
                  "Previous Hackathons",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),

              SizedBox(
                height: 240,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 20),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 120,
                      child: Column(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/profile.jpg',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 120,
  decoration: BoxDecoration(
          color: Colors.white, // Set the background to the pastel color
          borderRadius: BorderRadius.circular(10),
         
           boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(187, 0, 0, 0), // Shadow color
            spreadRadius: 2, // How much the shadow spreads
            blurRadius: 10, // How blurry the shadow is
            offset: Offset(2, 3), // Shadow offset (creates the illusion of depth)
          ),
        ],
        ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                "AI Hilly",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "4 November",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                ),
                                onPressed: () {
                                                 Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Hachthonepage()),
                    );
                                  },
                                child: Text(
                                  "Join Now",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                           SizedBox(height: 10),

                            ],
                          ),
                        ),
                      ]),
                    );
                  },
                ),
              ),
            

              // Upcoming Hackathons

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      AppColors.primary
                    ], // Define the gradient colors
                    begin: Alignment.centerLeft, // Start of the gradient (left)
                    end: Alignment.centerRight, // End of the gradient (right)
                  ),
                ),
                child: Text(
                  "Upcoming Hackathons",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(20),
                    
        decoration: BoxDecoration(
          color: Colors.white, // Set the background to the pastel color
          borderRadius: BorderRadius.circular(10),
         
           boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(187, 0, 0, 0), // Shadow color
            spreadRadius: 2, // How much the shadow spreads
            blurRadius: 10, // How blurry the shadow is
            offset: Offset(2, 3), // Shadow offset (creates the illusion of depth)
          ),
        ],
        ),
                    child: Row(
                      children: [
                        Container(
                          
                          width: 60,
                          height: 60,
                          color: Colors.white,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'assets/profile.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hilly Hack",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Artificial Intelligence",
                                style: TextStyle(color: Colors.black),
                              ),
                              const SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom:10 , left: 10, right: 10),
                              width: 70,
                                decoration: BoxDecoration(
color: const Color.fromARGB(47, 158, 158, 158),
          borderRadius: BorderRadius.circular(10),
         
           boxShadow: [
          BoxShadow(
            color: Colors.white, // Shadow color
            spreadRadius: 2, // How much the shadow spreads
            blurRadius: 10, // How blurry the shadow is
            offset: Offset(5, 5), // Shadow offset (creates the illusion of depth)
          ),
        ],
        ),

                              child:   Text(
                                "3d left",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),

                            ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Hachthonepage()),
                    );
                            
                          },
                          child: Text("Apply Now"),
                        ),
                      ],
                    ),
                  );
                },
                
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
            icon: Icon(Icons.person, color: Colors.white, size: 30.0),
            onPressed: () {
               Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
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
