// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:first_try_signup/AdminInterface/HomePage/homepage.dart';
import 'package:first_try_signup/Login/signup.dart';
import 'package:flutter/material.dart';
import 'package:first_try_signup/Style/Style_Meriem/styles.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool loginFailed = true;
  bool loginSuccess = false;
  bool error = false;

  void _login() {
    String email = _emailController.text;

    // Regular expression for validating an email
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    

    setState(() {
      if (emailRegex.hasMatch(email)) {
        // If email is valid
        loginFailed = false;
        loginSuccess = true;
        error = false;
      } else {
        // If email is invalid
        loginFailed = true;
        loginSuccess = false;
        error = true;
      }
    });
  }

  void _logout() {
    setState(() {
      loginFailed = true;
      loginSuccess = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor:  AppColors.primary,
       
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image:
                  AssetImage('assets/logo.png'), // Replace with your image path
              height: 200, // Set the height of the image
              width: 200, // Set the width of the image
              fit: BoxFit.contain, // Adjust the image scaling if needed
            ),
            // Login Section
            Visibility(
              visible: loginFailed,
              child: Container(
                margin: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    
                   TextFormField(
  controller: _emailController,
  decoration: InputDecoration(
    filled: true, // Enable the background fill
    fillColor: Colors.white, // Set the background color to white
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.pink),
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    labelText: 'Email',
    floatingLabelBehavior: FloatingLabelBehavior.never, // Ensures the label disappears when typing
    prefixIcon: Padding(
      padding: EdgeInsets.only(left: 20, right: 15), // Space around the icon
      child: Icon(
        Icons.person,
        color: AppColors.primary,
      ),
    ),
    contentPadding: EdgeInsets.only(left: 20, right: 20), 
  ),
  keyboardType: TextInputType.emailAddress, // Use email-specific input type
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
    floatingLabelBehavior: FloatingLabelBehavior.never, // Ensures the label disappears when typing
    prefixIcon: Padding(
      padding: EdgeInsets.only(left: 20, right: 15), // Space around the icon
      child: Icon(
        Icons.lock,
        color: const Color(0xFF27105B),
      ),
    ),
    contentPadding: EdgeInsets.only(left: 20, right: 20), // Space inside the text field
  ),
  obscureText: true, // To mask password input
  keyboardType: TextInputType.text,
),

                    SizedBox(height: 20),
                 
                 ElevatedButton(
  onPressed: () {
    _login(); // Call the _login method to validate the email
    if (loginSuccess) { // If login is successful
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()), // Navigate to homepage
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 182, 160, 249),
    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
  ),
  child: Text(
    'Sign In',
    style: TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
  ),
),

                    SizedBox(height: 20),
                       TextButton(
                      onPressed: () {
                        // Handle forgot password logic here if needed
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                      SizedBox(height: 5),
                      Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      
                        // Handle forgot password logic here if needed
                      
                      Text(
                        'Dont have an account?',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 199, 197, 197),
                          fontSize: 13,
                        ),
                      ),
                    
                         TextButton(
                      onPressed: () {
                         Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage()),
                            );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),

                        ],
                      ),
                      SizedBox(height: 10),

                    Visibility(
                      visible: error,
                      child: Text(
                        'Invalid email address. Please enter a valid email.',
                        style: TextStyle( 
                          color: Colors.red,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
