import 'package:first_try_signup/UserInterface/HomePage/homepage.dart';
import 'package:first_try_signup/UserInterface/Profile/profile.dart';
import 'package:flutter/material.dart';
import 'change_email.dart';
import 'change_password.dart';
import 'change_phone_number.dart';
import 'country.dart';

import 'package:first_try_signup/Style/Style_Meriem/styles.dart';
import 'package:first_try_signup/UserInterface/HomePage/homepage.dart';
import 'package:first_try_signup/UserInterface/MyHachathones/MyHachathons.dart';
import 'package:first_try_signup/UserInterface/Profile/profile.dart';
import 'package:flutter/material.dart';

import 'package:first_try_signup/Style/Style_Meriem/styles.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
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

        ),
      ),
      body: Container(
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
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildRow(
                    icon: Icons.phone,
                    label: 'Phone Number',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePhoneNumber()),
                    ),
                  ),
                  _buildRow(
                    icon: Icons.person,
                    label: 'Email Address',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangeEmail()),
                    ),
                  ),
                  _buildRow(
                    icon: Icons.lock,
                    label: 'Password',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePassword()),
                    ),
                  ),
                  _buildRow(
                    icon: Icons.public,
                    label: 'Country',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CountryEditPage()),
                    ),
                  ),
                ],
              ),
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

  Widget _buildRow({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF3B0086)),
                SizedBox(width: 10),
                Text(
                  label,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

  

Widget _buildBottomNavItem(IconData icon, VoidCallback onTap) {
  return IconButton(
    icon: Icon(icon, color: Colors.white, size: 28.0),
    onPressed: onTap,
  );
}