
import 'package:first_try_signup/UserInterface/HomePage/homepage.dart';
import 'package:first_try_signup/UserInterface/MyHachathones/MyHachathons.dart';
import 'package:first_try_signup/UserInterface/Profile/profile.dart';
import 'package:flutter/material.dart';

import 'package:first_try_signup/Style/Style_Meriem/styles.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms and Conditions',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF3B0086),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: double.infinity,
       decoration: BoxDecoration(
          gradient: RadialGradient(
          colors: const [
            Color(0xff5123C0), 
           Color(0xff27105B), 
           ],
          stops: const [0.0, 1.0],
          radius: 2.0,
          center: Alignment.center,
           ),
          ),

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Terms and Conditions',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3B0086),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '1. By using this application, you agree to abide by the terms and conditions outlined here.\n\n'
                          '2. The application reserves the right to modify the terms without prior notice.\n\n'
                          '3. Users must ensure that their activities on the app comply with all applicable laws.\n\n'
                          '4. Unauthorized use of the app may result in termination of your account.\n\n'
                          '5. For more details, please contact innohack@example.com.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: TextButton.icon(
                    onPressed: () {
                      
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.check_circle, color: Color(0xFF3B0086)),
                    label: const Text(
                      'Accept Terms',
                      style: TextStyle(
                        color: Color(0xFF3B0086),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
