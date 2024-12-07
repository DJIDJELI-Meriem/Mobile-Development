import 'package:first_try_signup/AdminInterface/CreateHack/create_event_page.dart';
import 'package:first_try_signup/AdminInterface/HomePage/homepage.dart';
import 'package:first_try_signup/AdminInterface/MyCreatedHackathone/my_created_hackathons.dart';
import 'package:first_try_signup/AdminInterface/MyHachathones/MyHachathons.dart';
import 'package:first_try_signup/AdminInterface/Profile/profileorg.dart';
import 'package:first_try_signup/Style/Style_Meriem/styles.dart';
import 'package:first_try_signup/Style/Style_sarab/themes.dart';
import 'package:first_try_signup/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: participants_infopage(),
    );
  }
}

class participants_infopage extends StatelessWidget {
  const participants_infopage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.primary, // Background purple
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'participants information',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildCardWithDropdown('max number of participants'),
            SizedBox(height: 20),
            _buildToggleButtons(),
            SizedBox(height: 20),
            _buildCardWithParticipants(),
            SizedBox(height: 20),
            _buildCardWithSkills(),
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

  Widget _buildCardWithDropdown(String title) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF682CA0), // Slightly lighter purple
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Color(0xFF8259B7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              underline: SizedBox(),
              dropdownColor: Color(0xFF8259B7),
              icon: Icon(Icons.arrow_drop_down, color: Colors.white),
              value: null,
              items: const [],
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButtons() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF682CA0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildToggleButton('individual work', isSelected: true),
          _buildToggleButton('team work'),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String text, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF8259B7) : Color(0xFF56306D),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCardWithParticipants() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF682CA0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'number of participants in each team',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDropdown('min'),
              _buildDropdown('max'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Color(0xFF8259B7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton<String>(
          isExpanded: true,
          underline: SizedBox(),
          dropdownColor: Color(0xFF8259B7),
          icon: Icon(Icons.arrow_drop_down, color: Colors.white),
          value: null,
          items: const [],
          onChanged: (value) {},
        ),
      ),
    );
  }

  Widget _buildCardWithSkills() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF682CA0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'skill needed',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              _buildSkillButton(),
              SizedBox(width: 10),
              _buildSkillCircle(),
              SizedBox(width: 10),
              _buildSkillCircle(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xFF8259B7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: const [
          Icon(Icons.add, color: Colors.white),
          SizedBox(width: 5),
          Text(
            'add skill',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCircle() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFF56306D),
        shape: BoxShape.circle,
      ),
    );
  }
}
