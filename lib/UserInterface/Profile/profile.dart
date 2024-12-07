import 'package:first_try_signup/UserInterface/HomePage/homepage.dart';
import 'package:first_try_signup/UserInterface/Profile/invite_friends.dart';
import 'package:first_try_signup/UserInterface/Profile/terms_conditions.dart';
import 'package:flutter/material.dart';
import 'settings.dart';
import 'edit_profile.dart';
import 'package:first_try_signup/UserInterface/MyHachathones/MyHachathons.dart';

import 'package:first_try_signup/Style/Style_Meriem/styles.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<String> _skills = [];

  final TextEditingController _skillController = TextEditingController();

  void _addSkill() {
    setState(() {
      if (_skillController.text.isNotEmpty) {
        _skills.add(_skillController.text);
        _skillController.clear();
      }
    });
    Navigator.pop(context);
  }

  Widget _experienceCard({
    required String title,
    required String company,
    required String duration,
    required String imagepath,
  }) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagepath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF3B0086),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    company,
                    style: TextStyle(color: const Color(0xFF3B0086)),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    duration,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3B0086),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Alex_Harper',
          style: TextStyle(color: Color(0xFF3B0086)),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Color(0xFF3B0086),
            ),
            onPressed: () {
              _showDrawerMenu(context);
            },
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
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

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileHeader(),
                const SizedBox(height: 20),
                _buildWorkshopsSection(),
                const SizedBox(height: 20),
                _buildSkillsSection(context),
                const SizedBox(height: 20),
                _buildExperienceSection(),
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

  Widget _buildProfileHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/picture.jpg'),
        ),
        const SizedBox(width: 30),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Alex',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildFollowStats(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFollowStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatColumn('Followers', '20k'),
        _buildStatColumn('Following', '20k'),
      ],
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _buildWorkshopsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tech Innovators Society (TIS)',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Workshops:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Data Viz',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('API Building', textAlign: TextAlign.center),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('ML Basics', textAlign: TextAlign.center),
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('Flutter Dev', textAlign: TextAlign.center),
                ),
              ],
            ),
            //_buildWorkshopChip('Data Viz'),
            // _buildWorkshopChip('API building'),
            // _buildWorkshopChip('ML Basics'),
            // _buildWorkshopChip('Flutter Dev'),
          ],
        ),
      ],
    );
  }

  Widget _buildWorkshopChip(String label) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSkillsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Skills:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          children: _skills.map((skill) {
            return Chip(
              label: Text(skill),
              backgroundColor: Colors.white,
              labelStyle: const TextStyle(color: Color(0xFF3B0086)),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF3B0086),
          ),
          onPressed: () {
            _showAddSkillDialog(context);
          },
          child: const Text('Add Skill'),
        ),
      ],
    );
  }

  void _showAddSkillDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add a Skill'),
          content: TextField(
            controller: _skillController,
            decoration: const InputDecoration(
              hintText: 'Enter new skill',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: _addSkill,
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildExperienceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Experience:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Row(
                children: [
                  _experienceCard(
                    title: 'Dev Fest',
                    company: 'Product Manager',
                    duration: 'Jan 2023 - Present',
                    imagepath: 'assets/images/pic1.jpg',
                  ),
                  _experienceCard(
                    title: 'CodeSprint',
                    company: 'Product Manager',
                    duration: 'Jun 2022 - Dec 2022',
                    imagepath: 'assets/images/pic2.jpg',
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  _experienceCard(
                    title: 'innoByte',
                    company: 'Product Manager',
                    duration: 'Jan 2022 - May 2022',
                    imagepath: 'assets/images/pic3.png',
                  ),
                  _experienceCard(
                    title: 'ByteTech',
                    company: 'Product Manager',
                    duration: 'Jul 2021 - Dec 2021',
                    imagepath: 'assets/images/pic4.jpg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  




  void _showDrawerMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Color(0xFF3B0086)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/picture.jpg'),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Alex Harper',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

               _buildDrawerItem(
                icon: Icons.edit,
                title: 'Edit Profile',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EditProfile()),
                  );
                },
              ),
              
              _buildDrawerItem(
                icon: Icons.insert_invitation,
                title: 'settings',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Settings()),
                  );
                },
              ),
             
              _buildDrawerItem(
                icon: Icons.policy,
                title: 'Terms and Conditions',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TermsConditions()),
                  );
                },
              ),
              _buildDrawerItem(
                icon: Icons.insert_invitation,
                title: 'Invite Friends',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const InviteFriends()),
                  );
                },
              ),
              _buildDrawerItem(
                icon: Icons.logout,
                title: 'Logout',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildDrawerItem(
    {required IconData icon,
    required String title,
    required void Function()? onTap}) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    onTap: onTap,
  );
}
