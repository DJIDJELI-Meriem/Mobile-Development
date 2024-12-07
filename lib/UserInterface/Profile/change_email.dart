import 'package:flutter/material.dart';
import 'profile.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({super.key});

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  final TextEditingController _oldEmailController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();
  final TextEditingController _confirmEmailController = TextEditingController();

  String? _errorMessage;

  void _validateAndSave() {
    setState(() {
      _errorMessage = null;
    });

    
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    String oldEmail = _oldEmailController.text;
    String newEmail = _newEmailController.text;
    String confirmEmail = _confirmEmailController.text;

    
    if (oldEmail.isEmpty || newEmail.isEmpty || confirmEmail.isEmpty) {
      setState(() {
        _errorMessage = 'All fields are required';
      });
      return;
    }


    if (!emailRegex.hasMatch(newEmail)) {
      setState(() {
        _errorMessage = 'Invalid email format';
      });
      return;
    }

    
    if (newEmail != confirmEmail) {
      setState(() {
        _errorMessage = 'Emails do not match';
      });
      return;
    }

    
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Profile()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        title: const Text(
          'Change Email',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                  controller: _oldEmailController,
                  decoration: InputDecoration(
                    labelText: 'Old email...',
                    prefixIcon: const Icon(
                      Icons.email,
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
                  controller: _newEmailController,
                  decoration: InputDecoration(
                    labelText: 'New email...',
                    prefixIcon: const Icon(
                      Icons.email,
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
                  controller: _confirmEmailController,
                  decoration: InputDecoration(
                    labelText: 'Confirm email...',
                    prefixIcon: const Icon(
                      Icons.email,
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
                const SizedBox(height: 20),
                if (_errorMessage != null)
                  Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: _validateAndSave,
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