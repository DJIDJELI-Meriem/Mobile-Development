import 'package:first_try_signup/AdminInterface/CreateHack/create_event_page.dart';
import 'package:first_try_signup/AdminInterface/HomePage/homepage.dart';
import 'package:first_try_signup/AdminInterface/MyCreatedHackathone/my_created_hackathons.dart';
import 'package:first_try_signup/AdminInterface/MyHachathones/MyHachathons.dart';
import 'package:first_try_signup/AdminInterface/Profile/invite_friends.dart';
import 'package:first_try_signup/AdminInterface/Profile/terms_conditions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'settings.dart';
import 'edit_profile.dart';
import 'package:first_try_signup/Style/Style_Meriem/styles.dart';

class Profileorg extends StatefulWidget {
  const Profileorg({super.key});

  @override
  State<Profileorg> createState() => _ProfileorgState();
}

class _ProfileorgState extends State<Profileorg> {
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
          'Spark_Hub',
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
                _buildProfileorgHeader(),
                const SizedBox(height: 20),
                _buildWorkshopsSection(),
                const SizedBox(height: 20),
                _buildExperienceSection(),
                const SizedBox(height: 20),
                buildSocialMediaSection(),
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

  Widget _buildProfileorgHeader() {
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
                'Spark Hub',
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
        Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF3B0086).withOpacity(0.9), 
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.white, width: 2),
    ),
    child: RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          height: 1.5, 
        ),
        children: [
          TextSpan(
            text: 'Bringing ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'creators ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          TextSpan(
            text: 'together to build and launch tech solutions. ',
          ),
          TextSpan(
            text: 'Join us ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'for hackathons, workshops, and networking ',
          ),
          TextSpan(
            text: 'to spark new ideas and projects.',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.deepPurpleAccent,
            ),
          ),
        ],

      ),
    ),
  ),
        const SizedBox(height: 20),
        const Text(
          'Past Events:',
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

  Widget _buildExperienceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upcoming:',
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
                decoration: const BoxDecoration(color:Color(0xFF3B0086)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/picture.jpg'),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Spark_Hub',
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

Widget buildSocialMediaSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text(
        'Connect with us on Social Media',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.facebook, color: Colors.white),
            onPressed: () {
              
            },
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(FontAwesomeIcons.twitter, color: Colors.white),
            onPressed: () {
              
            },
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(FontAwesomeIcons.linkedin, color: Colors.white),
            onPressed: () {
              
            },
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(FontAwesomeIcons.instagram, color: Colors.white),
            onPressed: () {
              
            },
          ),
        ],
      ),
    ],
  );
}
