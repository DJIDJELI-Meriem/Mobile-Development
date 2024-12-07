// ignore_for_file: prefer_const_constructors


import 'package:first_try_signup/UserInterface/HomePage/homepage.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:first_try_signup/Style/Style_Meriem/styles.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => __signupPageState();
}

class __signupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  String errorMessage = ''; // Holds the error message
  bool loginSuccess = false;

  void __signup() {
    String email = _emailController.text.trim();
    String firstName = _firstNameController.text.trim();
    String lastName = _lastNameController.text.trim();
    String password = _passwordController.text.trim();

    // Regular expressions for validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    final nameRegex = RegExp(r'^[a-zA-Z]+$'); // Only letters allowed for names

    setState(() {
      if (email.isEmpty || firstName.isEmpty || lastName.isEmpty || password.isEmpty) {
        // Check if any field is empty
        errorMessage = 'All fields are required. Please fill in all fields.';
        loginSuccess = false;
      } else if (!emailRegex.hasMatch(email) && !nameRegex.hasMatch(firstName) && !nameRegex.hasMatch(lastName)) {
        // All three fields are invalid
        errorMessage = 'First name, last name must not contain numbers, and invalid email address.';
        loginSuccess = false;
      } else if (!emailRegex.hasMatch(email) && !nameRegex.hasMatch(firstName)) {
        // Email and first name are invalid
        errorMessage = 'First name must not contain numbers, and invalid email address.';
        loginSuccess = false;
      } else if (!emailRegex.hasMatch(email) && !nameRegex.hasMatch(lastName)) {
        // Email and last name are invalid
        errorMessage = 'Last name must not contain numbers, and invalid email address.';
        loginSuccess = false;
      } else if (!nameRegex.hasMatch(firstName) && !nameRegex.hasMatch(lastName)) {
        // Both first name and last name are invalid
        errorMessage = 'First name and last name must not contain numbers.';
        loginSuccess = false;
      } else if (!emailRegex.hasMatch(email)) {
        // Only email is invalid
        errorMessage = 'Invalid email address. Please enter a valid email.';
        loginSuccess = false;
      } else if (!nameRegex.hasMatch(firstName)) {
        // Only first name is invalid
        errorMessage = 'First name must not contain numbers.';
        loginSuccess = false;
      } else if (!nameRegex.hasMatch(lastName)) {
        // Only last name is invalid
        errorMessage = 'Last name must not contain numbers.';
        loginSuccess = false;
      } else {
        // All validations passed
        errorMessage = '';
        loginSuccess = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/logo.png'),
                height: 200,
                width: 200,
                fit: BoxFit.contain,
              ),
              Visibility(
                visible: errorMessage.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    errorMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
          
           Container(
            margin: EdgeInsets.only(left: 35, right: 35),
            child: Column(
              children: [
                  Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                 TextFormField(
              
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        filled: true, // Enable the background fill
                        fillColor:
                            Colors.white, // Set the background color to white
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        labelText: 'First Name',
                        floatingLabelBehavior: FloatingLabelBehavior
                            .never, // Ensures the label disappears when typing
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 15), // Space around the icon
                          child: Icon(
                            Icons.person,
                            color: AppColors.primary,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                      ),
                      keyboardType: TextInputType
                          .text, // Use email-specific input type
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        filled: true, // Enable the background fill
                        fillColor:
                            Colors.white, // Set the background color to white
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        labelText: 'Last Name',
                        floatingLabelBehavior: FloatingLabelBehavior
                            .never, // Ensures the label disappears when typing
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 15), // Space around the icon
                          child: Icon(
                            Icons.person,
                            color: AppColors.primary,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                      ),
                      keyboardType: TextInputType
                          .text, // Use email-specific input type
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true, // Enable the background fill
                        fillColor:
                            Colors.white, // Set the background color to white
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        labelText: 'Email',
                        floatingLabelBehavior: FloatingLabelBehavior
                            .never, // Ensures the label disappears when typing
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 15), // Space around the icon
                          child: Icon(
                            Icons.person,
                            color: AppColors.primary,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                      ),
                      keyboardType: TextInputType
                          .emailAddress, // Use email-specific input type
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        filled: true, // Enable the background fill
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        labelText: 'Password',
                        floatingLabelBehavior: FloatingLabelBehavior
                            .never, // Ensures the label disappears when typing
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 15), // Space around the icon
                          child: Icon(
                            Icons.lock,
                            color: const Color(0xFF27105B),
                          ),
                        ),
                        contentPadding: EdgeInsets.only(
                            left: 20, right: 20), // Space inside the text field
                      ),
                      obscureText: true, // To mask password input
                      keyboardType: TextInputType.text,
                    ),
              ],
            ),
           ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  __signup();
                  if (loginSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 182, 160, 249),
                  padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 199, 197, 197),
                      fontSize: 13,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      labelText: label,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      prefixIcon: Icon(icon, color: AppColors.primary),
    );
  }
}
