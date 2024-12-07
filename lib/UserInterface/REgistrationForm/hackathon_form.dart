
import 'package:first_try_signup/Style/Douaa-Style/colors.dart';
import 'package:first_try_signup/Style/Douaa-Style/radio_button.dart';
import 'package:first_try_signup/Style/Douaa-Style/style.dart';
import 'package:first_try_signup/Style/Style_Meriem/styles.dart';
import 'package:first_try_signup/UserInterface/HomePage/homepage.dart';
import 'package:first_try_signup/UserInterface/MyHachathones/MyHachathons.dart';
import 'package:first_try_signup/UserInterface/Profile/profile.dart';
import 'package:flutter/material.dart';





class hackathone_form extends StatefulWidget {
  const hackathone_form({super.key});

  @override
  State<hackathone_form> createState() => __hackathone_form();
}

class __hackathone_form extends State<hackathone_form> {
  //validator Form 
  final _formKey = GlobalKey<FormState>();

  //variables 
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _hackathonExperienceController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();
  final TextEditingController _motivationController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _organizationController = TextEditingController();
  
  //selected options 
  String? selectedOption1; // For the first radio group
  String? selectedOption2; // For the second radio group
  String? selectedOption3; 
  String? selectedOption4; 
  String? selectedOption5; 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: const Color.fromARGB(148, 255, 255, 255),
       ),
       body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          decoration: backColor,
          child : Form( 
          key: _formKey,
          child: Column(
            
            children: [
              //title
              Text(
                "registartion form ", 
                style: TextStyle(color: Colors.white , fontSize: 26 , fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20,),
              Container(
                 width: 400,
                 padding: EdgeInsets.all(16.0),
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                 ),
                 child: Column(
                  
                  children: [
                    //title : basic information 
                    SizedBox(height: 30,),

                    Text(
                      "basic information" , 
                      style: midTitles,
                    ) , 
          
                    SizedBox(height: 30,),
                   Container( 
                    margin: EdgeInsets.only(right: 230),
                    child : Text(
                      "Full Name" , 
                      style: smallTitles,
                     ) ,
                    ),
                   
                    SizedBox(height: 7,),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                         hintText: 'Enter your name',
                         hintStyle: TextStyle(
                          color: const Color.fromARGB(150, 255, 255, 255) , 
                          fontSize: 14,
                         ),
                         border: OutlineInputBorder( 
                          borderSide: BorderSide(
                               color: inputFieldColor, // Change the border color
                               width: 2.0, // Optional: Set the border width
                          ),
                         borderRadius: BorderRadius.circular(15.0), // Rounded corners
                         ),
                         filled: true,
                         fillColor: inputFieldColor,
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) {
                         return "Please enter your name"; // Error message shown below the field
                        }
                         return null; // No error if valid 
                      },
                    ),
                    

                    SizedBox(height: 30,),
                   Container( 
                    margin: EdgeInsets.only(right: 200),
                    child : Text(
                      "Email Address" , 
                      style: smallTitles,
                     ) ,
                    ),
                   
                    SizedBox(height: 7,),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                         hintText: 'Enter your email address',
                         hintStyle: TextStyle(
                          color: const Color.fromARGB(150, 255, 255, 255) , 
                          fontSize: 14,
                         ),
                         border: OutlineInputBorder( 
                          borderSide: BorderSide(
                               color: inputFieldColor, // Change the border color
                               width: 2.0, // Optional: Set the border width
                          ),
                         borderRadius: BorderRadius.circular(15.0), // Rounded corners
                         ),
                         filled: true,
                         fillColor: inputFieldColor,
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) {
                         return "Please enter your name"; // Error message shown below the field
                        }
                        if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                          return "Enter a valid email address";
                        }
                         return null; // No error if valid 
                      },
                    ),

                    SizedBox(height: 30,),
                   Container( 
                    margin: EdgeInsets.only(right: 200),
                    child : Text(
                      "phone number" , 
                      style: smallTitles,
                     ) ,
                    ),
                   
                    SizedBox(height: 7,),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                         hintText: 'Enter your phone number',
                         hintStyle: TextStyle(
                          color: const Color.fromARGB(150, 255, 255, 255) , 
                          fontSize: 14,
                         ),
                         border: OutlineInputBorder( 
                          borderSide: BorderSide(
                               color: inputFieldColor, // Change the border color
                               width: 2.0, // Optional: Set the border width
                          ),
                         borderRadius: BorderRadius.circular(15.0), // Rounded corners
                         ),
                         filled: true,
                         fillColor: inputFieldColor,
                      ),
                       validator: (value){
                        if (value == null || value.isEmpty) {
                         return "Please enter your phone number"; // Error message shown below the field
                        }
                        if(!RegExp(r'^\d+$').hasMatch(value)){
                          return "Enter a valid phone number";
                        }
                         return null; // No error if valid 
                      },
                    ),

                    SizedBox(height: 30,),
                   Container( 
                    margin: EdgeInsets.only(right: 275),
                    child : Text(
                      "age" , 
                      style: smallTitles,
                     ) ,
                     
                    ),
                   
                    SizedBox(height: 7,),
                    TextFormField(
                      controller: _ageController,
                      decoration: InputDecoration(
                         hintText: 'Enter your age',
                         hintStyle: TextStyle(
                          color: const Color.fromARGB(150, 255, 255, 255) , 
                          fontSize: 14,
                         ),
                         border: OutlineInputBorder( 
                          borderSide: BorderSide(
                               color: inputFieldColor, // Change the border color
                               width: 2.0, // Optional: Set the border width
                          ),
                         borderRadius: BorderRadius.circular(15.0), // Rounded corners
                         ),
                         filled: true,
                         fillColor: inputFieldColor,
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) {
                         return "Please enter your age"; // Error message shown below the field
                        }
                         return null; // No error if valid 
                      },
                    ),


                  //title : past expiriences and skills information 
                    SizedBox(height: 45,),

                    Text(
                      "Past experiences and skills" , 
                      style: midTitles,
                    ) , 
          
                    SizedBox(height: 30,),

                  //ever participated before ?
                  Text(
                      "have you participated in hackathons before ?" , 
                      style: smallTitles,
                     ) ,

                  SizedBox(height: 7,),  
                  Theme(
                        data: Theme.of(context).copyWith(
                            unselectedWidgetColor: Colors.grey, // Change the outline color for these radios
                          ),
                        child: CustomRadioGroup(
                        options: ['yes', 'no'],
                        selectedValue: 'yes',
                        onChanged: (value) {
                          selectedOption1=value;
                            },
                    activeColor: CheckColor, // Color for the filled circle
                      ),
                     ),
                 
                  SizedBox(height: 25,),
                  //if yes ?
                  Text(
                      "tell us about some of your experiences ?" , 
                      style: smallTitles,
                     ) ,
                  SizedBox(height: 14,),
                    TextFormField(
                      controller: _hackathonExperienceController,
                      decoration: InputDecoration(
                         hintText: 'describe some experiences that you had ',
                         hintStyle: TextStyle(
                          color: const Color.fromARGB(150, 255, 255, 255) , 
                          fontSize: 14,
                         ),
                         border: OutlineInputBorder( 
                          borderSide: BorderSide(
                               color: inputFieldColor, // Change the border color
                               width: 2.0, // Optional: Set the border width
                          ),
                         borderRadius: BorderRadius.circular(15.0), // Rounded corners
                         ),
                         filled: true,
                         fillColor: inputFieldColor,
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) {
                         return "Please fill in this field"; // Error message shown below the field
                        }
                         return null; // No error if valid 
                      },
                    ),   

                  SizedBox(height: 25,),

                  //primary skills
                  Text(
                      "what are your primary skills ?" , 
                      style: smallTitles,
                     ) ,
                  SizedBox(height: 10,),
                   TextFormField(
                      controller: _skillsController,
                      decoration: InputDecoration(
                         hintText: 'enter some of your skills  ',
                         hintStyle: TextStyle(
                          color: const Color.fromARGB(150, 255, 255, 255) , 
                          fontSize: 14,
                         ),
                         border: OutlineInputBorder( 
                          borderSide: BorderSide(
                               color: inputFieldColor, // Change the border color
                               width: 2.0, // Optional: Set the border width
                          ),
                         borderRadius: BorderRadius.circular(15.0), // Rounded corners
                         ),
                         filled: true,
                         fillColor: inputFieldColor,
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) {
                         return "Please fill in this field"; // Error message shown below the field
                        }
                         return null; // No error if valid 
                      },
                    ),
                   



                  //title : Team and collaboration
                    SizedBox(height: 45,),

                    Text(
                      "Team and Collaboration" , 
                      style: midTitles,
                    ) , 
                    SizedBox(height: 15,),  
                    Text(
                      "do you have a team ?" , 
                      style: smallTitles,
                     ) ,
                     Theme(
                        data: Theme.of(context).copyWith(
                            unselectedWidgetColor: Colors.grey, // Change the outline color for these radios
                          ),
                        child: CustomRadioGroup(
                        options: ['yes', 'no'],
                        selectedValue: 'yes',
                        onChanged: (value) {
                          selectedOption2=value;
                            },
                    activeColor: CheckColor, // Color for the filled circle
                      ),
                     ),
                

                  SizedBox(height: 15,),
                    
                   Text(
                      "would you like to be matched with a team ?" , 
                      style: smallTitles,
                     ) ,
                     SizedBox(height: 10,),  
                     Theme(
                        data: Theme.of(context).copyWith(
                            unselectedWidgetColor: Colors.grey, // Change the outline color for these radios
                          ),
                        child: CustomRadioGroup(
                        options: ['yes', 'no'],
                        selectedValue: 'yes',
                        onChanged: (value) {
                          selectedOption3=value;
                            },
                    activeColor: CheckColor, // Color for the filled circle
                      ),
                     ),
                
                  

                  SizedBox(height: 15,), 
                  Text(
                      "what role do you prefer in a team ?" , 
                      style: smallTitles,
                     ) ,

                  SizedBox(height: 10,), 
                  Theme(
                        data: Theme.of(context).copyWith(
                            unselectedWidgetColor: Colors.grey, // Change the outline color for these radios
                          ),
                        child: CustomRadioGroup(
                        options: ['developer', 'designer'],
                        selectedValue: 'yes',
                        onChanged: (value) {
                          selectedOption4=value;
                            },
                    activeColor: CheckColor, // Color for the filled circle
                      ),
                     ),
          
                    SizedBox(height: 45,),

                  //title : interests and goals


                    Text(
                      "Interests and Goals" , 
                      style: midTitles,
                    ) , 

                  SizedBox(height: 15,), 
                  Text(
                      "what is your goal from participating ?" , 
                      style: smallTitles,
                     ) ,
                     SizedBox(height: 7,),
                   TextFormField(
                      controller: _goalController,
                      decoration: InputDecoration(
                         hintText: 'enter some of your skills  ',
                         hintStyle: TextStyle(
                          color: const Color.fromARGB(150, 255, 255, 255) , 
                          fontSize: 14,
                         ),
                         border: OutlineInputBorder( 
                          borderSide: BorderSide(
                               color: inputFieldColor, // Change the border color
                               width: 2.0, // Optional: Set the border width
                          ),
                         borderRadius: BorderRadius.circular(15.0), // Rounded corners
                         ),
                         filled: true,
                         fillColor: inputFieldColor,
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) {
                         return "Please fill in this field"; // Error message shown below the field
                        }
                         return null; // No error if valid 
                      },
                    ),
          
                    SizedBox(height: 30,),

                  SizedBox(height: 15,), 
                  Text(
                      "what motivates you to participate  ?" , 
                      style: smallTitles,
                     ) ,
                     SizedBox(height: 7,),
                   TextFormField(
                      controller: _motivationController,
                      decoration: InputDecoration(
                         hintText: 'enter some of your skills  ',
                         hintStyle: TextStyle(
                          color: const Color.fromARGB(150, 255, 255, 255) , 
                          fontSize: 14,
                         ),
                         border: OutlineInputBorder( 
                          borderSide: BorderSide(
                               color: inputFieldColor, // Change the border color
                               width: 2.0, // Optional: Set the border width
                          ),
                         borderRadius: BorderRadius.circular(15.0), // Rounded corners
                         ),
                         filled: true,
                         fillColor: inputFieldColor,
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) {
                         return "Please fill in this field"; // Error message shown below the field
                        }
                         return null; // No error if valid 
                      },
                    ),

               
  

                  //title : background
                    SizedBox(height: 45,),

                    Text(
                      "backgorund" , 
                      style: midTitles,
                    ) ,

                          SizedBox(height: 15,), 
                  Text(
                      "what is your educational background?" , 
                      style: smallTitles,
                     ) ,
                     SizedBox(height: 7,),
                   TextFormField(
                      controller: _educationController,
                      decoration: InputDecoration(
                         hintText: 'enter some of your skills  ',
                         hintStyle: TextStyle(
                          color: const Color.fromARGB(150, 255, 255, 255) , 
                          fontSize: 14,
                         ),
                         border: OutlineInputBorder( 
                          borderSide: BorderSide(
                               color: inputFieldColor, // Change the border color
                               width: 2.0, // Optional: Set the border width
                          ),
                         borderRadius: BorderRadius.circular(15.0), // Rounded corners
                         ),
                         filled: true,
                         fillColor: inputFieldColor,
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) {
                         return "Please fill in this field"; // Error message shown below the field
                        }
                         return null; // No error if valid 
                      },
                    ),

                           SizedBox(height: 15,), 
                  Text(
                      "what is your current institution organization ?" , 
                      style: smallTitles,
                     ) , 
                     SizedBox(height: 7,),
                   TextFormField(
                      controller: _organizationController,
                      decoration: InputDecoration(
                         hintText: 'enter some of your skills  ',
                         hintStyle: TextStyle(
                          color: const Color.fromARGB(150, 255, 255, 255) , 
                          fontSize: 14,
                         ),
                         border: OutlineInputBorder( 
                          borderSide: BorderSide(
                               color: inputFieldColor, // Change the border color
                               width: 2.0, // Optional: Set the border width
                          ),
                         borderRadius: BorderRadius.circular(15.0), // Rounded corners
                         ),
                         filled: true,
                         fillColor: inputFieldColor,
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) {
                         return "Please fill in this field"; // Error message shown below the field
                        }
                         return null; // No error if valid 
                      },
                    ),
        

                  //title : consent agreement 
                    SizedBox(height: 45,),

                    Text(
                      "Consent agreement" , 
                      style: midTitles,
                    ) , 

                    SizedBox(height: 15,), 
                  Text(
                      "do you agree to the code of the conduct ?" , 
                      style: smallTitles,
                     ) , 
                     SizedBox(height: 15,), 
                     Theme(
                        data: Theme.of(context).copyWith(
                            unselectedWidgetColor: Colors.grey, // Change the outline color for these radios
                          ),
                        child: CustomRadioGroup(
                        options: ['yes', 'no'],
                        selectedValue: 'yes',
                        onChanged: (value) {
                          selectedOption5=value;
                            },
                    activeColor: CheckColor, // Color for the filled circle
                      ),
                     ),
          
                    SizedBox(height: 30,),

                  //submit button 
                  Container(
                    width: 400,
                    height: 50,
                     child:ElevatedButton(
                    onPressed: () {
                      // Check if the form is valid
                      if (_formKey.currentState!.validate()) {
                        // If valid, proceed
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Form Submitted Successfully!"),
                          ),
                        );
                      }
                    }, 
                    child: Text("submit" , style:TextStyle(color: const Color.fromARGB(206, 255, 255, 255) , 
                          fontSize: 14,) , ),
                    style:  ElevatedButton.styleFrom(
                      backgroundColor: CheckColor,
                    ),
                    ) ,

                  ),   
                  


                  ],
                   
                 ),
                 
                 
              )


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