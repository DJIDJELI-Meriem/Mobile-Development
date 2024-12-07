import 'package:flutter/material.dart';
import 'profile.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void validateAndSubmit() {
    final oldPassword = oldPasswordController.text.trim();
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    try {
      if (oldPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
        throw Exception('All fields are required.');
      }

      
      if (oldPassword != "currentPassword") {
        throw Exception('Old password is incorrect.');
      }

      if (newPassword != confirmPassword) {
        throw Exception('New password and confirm password do not match.');
      }

      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Profile()),
      );
    } catch (e) {
     
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Change Password',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF3B0086),
                Color(0xFF8F00FF),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
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

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/picture.jpg"),
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: oldPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Old password...',
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xFF3B0086),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFF3B0086), width: 2.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: newPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'New password...',
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xFF3B0086),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFF3B0086), width: 2.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm password...',
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xFF3B0086),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFF3B0086), width: 2.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 70),
                ElevatedButton(
                  onPressed: validateAndSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 192, 192, 22),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
       bottomNavigationBar: _buildCustomBottomNavigationBar(),
    );
  }
}

 Widget _buildCustomBottomNavigationBar() {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(0.0),
      topRight: Radius.circular(0.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.deepPurple, Colors.purpleAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBottomNavItem(Icons.home, () {
              // Action for home
            }),
            _buildBottomNavItem(Icons.search, () {
              // Action for search
            }),
            _buildBottomNavItem(Icons.add_circle_outline, () {
              // Action for add
            }),
            _buildBottomNavItem(Icons.manage_accounts, () {
              // Action for manage accounts
            }),
            _buildBottomNavItem(Icons.person, () {
              // Action for profile
            }),
          ],
        ),
      ),
    ),
  );
}

Widget _buildBottomNavItem(IconData icon, VoidCallback onTap) {
  return IconButton(
    icon: Icon(icon, color: Colors.white, size: 28.0),
    onPressed: onTap,
  );
}