import 'package:first_try_signup/AdminInterface/Profile/profileorg.dart';
import 'package:flutter/material.dart';


class ChangePhoneNumber extends StatefulWidget {
  const ChangePhoneNumber({super.key});

  @override
  State<ChangePhoneNumber> createState() => _ChangePhoneNumberState();
}

class _ChangePhoneNumberState extends State<ChangePhoneNumber> {
  final TextEditingController _oldPhoneController = TextEditingController();
  final TextEditingController _newPhoneController = TextEditingController();
  final TextEditingController _confirmPhoneController = TextEditingController();

  void _validateAndChangePhoneNumber() {
    String oldPhone = _oldPhoneController.text.trim();
    String newPhone = _newPhoneController.text.trim();
    String confirmPhone = _confirmPhoneController.text.trim();

    if (oldPhone.isEmpty || newPhone.isEmpty || confirmPhone.isEmpty) {
      _showError("All fields are required.");
      return;
    }

    if (newPhone != confirmPhone) {
      _showError("New phone numbers do not match.");
      return;
    }

    if (!_isValidPhoneNumber(newPhone)) {
      _showError("Invalid phone number format.");
      return;
    }


    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Profileorg()),
    );
  }

  bool _isValidPhoneNumber(String phone) {
    final RegExp phoneRegex = RegExp(r'^\d{10}$');
    return phoneRegex.hasMatch(phone);
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Change Phone Number',
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
                  controller: _oldPhoneController,
                  decoration: InputDecoration(
                    labelText: 'Old phone number...',
                    prefixIcon: const Icon(
                      Icons.phone,
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
                  controller: _newPhoneController,
                  decoration: InputDecoration(
                    labelText: 'New phone number...',
                    prefixIcon: const Icon(
                      Icons.phone,
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
                  controller: _confirmPhoneController,
                  decoration: InputDecoration(
                    labelText: 'Confirm phone number...',
                    prefixIcon: const Icon(
                      Icons.phone,
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
                  onPressed: _validateAndChangePhoneNumber,
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