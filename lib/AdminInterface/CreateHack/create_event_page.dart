import 'package:first_try_signup/AdminInterface/CreateHack/Schedule.dart';
import 'package:first_try_signup/AdminInterface/CreateHack/participants_information.dart';
import 'package:first_try_signup/AdminInterface/HomePage/homepage.dart';
import 'package:first_try_signup/AdminInterface/MyCreatedHackathone/my_created_hackathons.dart';
import 'package:first_try_signup/AdminInterface/MyHachathones/MyHachathons.dart';
import 'package:first_try_signup/AdminInterface/Profile/profileorg.dart';
import 'package:first_try_signup/Style/Douaa-Style/circles.dart';
import 'package:first_try_signup/Style/Douaa-Style/colors.dart';
import 'package:first_try_signup/Style/Douaa-Style/style.dart';
import 'package:first_try_signup/Style/Style_Meriem/styles.dart';
import 'package:first_try_signup/Style/Style_sarab/themes.dart';
import 'package:flutter/material.dart';


class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEvent();
}

class _CreateEvent extends State<CreateEvent> {
  //form key
  final _formKey = GlobalKey<FormState>();
  //variables 
  final TextEditingController _fieldController = TextEditingController();
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _startdateController = TextEditingController();
  final TextEditingController _enddateController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _firstprizeController = TextEditingController();
  final TextEditingController _secondprozeController = TextEditingController();
  final TextEditingController _thirdprizeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  //selected options 
  String? selectedOption1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(

          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          decoration: backColor,
          child: Column(
            children: [
              //for the image 
              Container(

              ),
              SizedBox(height: 30,),
              Text(
                "General information" , 
                style: yellowTitles,
              ), 
               SizedBox(height: 30,),

              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  width: 400,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                 ),
                  child: Column(
                    children: [
                      Container( 
                    margin: EdgeInsets.only(right: 260),
                    child : Text(
                      "Field" , 
                      style: smallTitles,
                     ) ,
                    ),
                   
                    SizedBox(height: 5,),
                    TextFormField(
                      controller: _fieldController,
                      decoration: InputDecoration(
                         hintText: 'Enter the field ',
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
                         return "Please fill this field"; // Error message shown below the field
                        }
                         return null; // No error if valid 
                      },
                    ),

                    SizedBox(height: 30,),

                    Container( 
                    margin: EdgeInsets.only(right: 260),
                    child : Text(
                      "Topic" , 
                      style: smallTitles,
                     ) ,
                    ),
                   
                    SizedBox(height: 5,),
                    TextFormField(
                      controller: _topicController,
                      decoration: InputDecoration(
                         hintText: 'Enter the Topic ',
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
                         return "Please fill this field"; // Error message shown below the field
                        }
                         return null; // No error if valid 
                      },
                    ),

                    SizedBox(height: 30,),

                    Container( 
                    margin: EdgeInsets.only(right: 260),
                    child : Text(
                      "Place" , 
                      style: smallTitles,
                     ) ,
                    ),
                   
                    SizedBox(height: 5,),
                    TextFormField(
                      controller: _placeController,
                      decoration: InputDecoration(
                         hintText: 'Enter the Plcace ',
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
                         return "Please fill this field"; // Error message shown below the field
                        }
                         return null; // No error if valid 
                      },
                    ),

                    SizedBox(height: 30,),

                    Container( 
                    margin: EdgeInsets.only(right: 230),
                    child : Text(
                      "Start Date" , 
                      style: smallTitles,
                     ) ,
                    ),
                   
                    SizedBox(height: 5,),
                    TextFormField(
                      controller: _startdateController,
                      decoration: InputDecoration(
                         hintText: 'Enter the start date  ',
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
                         return "Please fill this field"; // Error message shown below the field
                        }
                         return null; // No error if valid 
                      },
                    ),

                    SizedBox(height: 30,),

                    Container( 
                    margin: EdgeInsets.only(right: 230),
                    child : Text(
                      "End Date" , 
                      style: smallTitles,
                     ) ,
                    ),
                   
                    SizedBox(height: 5,),
                    TextFormField(
                      controller: _enddateController,
                      decoration: InputDecoration(
                         hintText: 'Enter the end date ',
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
                         return "Please fill this field"; // Error message shown below the field
                        }
                         return null; // No error if valid 
                      },
                    ),

                    SizedBox(height: 30,),

                    Container( 
                    margin: EdgeInsets.only(right: 260),
                    child : Text(
                      "Price" , 
                      style: smallTitles,
                     ) ,
                    ),
                   
                    SizedBox(height: 5,),
                    TextFormField(
                      controller: _priceController,
                      decoration: InputDecoration(
                         hintText: 'Enter the price  ',
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
                         return "Please fill this field"; // Error message shown below the field
                        }
                         return null; // No error if valid 
                      },
                    ),
                    
                    ],
                  ),

                ),
                
              ),
              SizedBox(height: 30,),
              Text(
                "Prizes" , 
                style: yellowTitles,
              ), 
               SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.all(16.0),
                  width: 400,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                 ),
                 child: Column(
                  children: [
                     SizedBox(height: 7,),
                     Container( 
                    margin: EdgeInsets.only(right: 200),
                    child : Text(
                      "First place prize" , 
                      style: smallTitles,
                     ) ,
                    ),
                   
                    SizedBox(height: 5,),
                    TextFormField(
                      controller: _firstprizeController,
                      decoration: InputDecoration(
                         hintText: 'First Place Prize  ',
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
                         return "Please fill this field"; // Error message shown below the field
                        }
                         return null; // No error if valid 
                      },
                    ),


                    SizedBox(height: 30,),
                     Container( 
                    margin: EdgeInsets.only(right: 180),
                    child : Text(
                      "second place prize" , 
                      style: smallTitles,
                     ) ,
                    ),
                   
                    SizedBox(height: 5,),
                    TextFormField(
                      controller: _secondprozeController,
                      decoration: InputDecoration(
                         hintText: 'Second Place Prize  ',
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
                         return "Please fill this field"; // Error message shown below the field
                        }
                         return null; // No error if valid 
                      },
                    ),


                    SizedBox(height: 30,),
                     Container( 
                    margin: EdgeInsets.only(right: 200),
                    child : Text(
                      "third place prize" , 
                      style: smallTitles,
                     ) ,
                    ),
                   
                    SizedBox(height: 5,),
                    TextFormField(
                      controller: _thirdprizeController,
                      decoration: InputDecoration(
                         hintText: 'Third Place Prize  ',
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
                         return "Please fill this field"; // Error message shown below the field
                        }
                         return null; // No error if valid 
                      },
                    ),

                    SizedBox(height: 7,),
                  ],
                 ),
              ),

             

              SizedBox(height: 60,),
              Text(
                "Description" , 
                style: yellowTitles,

              ), 
              SizedBox(height: 25,),
             TextFormField(
  controller: _descriptionController,
  textAlignVertical: TextAlignVertical.top, // Aligns the text at the top
  decoration: InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: inputFieldColor, // Change the border color
        width: 2.0, // Optional: Set the border width
      ),
      borderRadius: BorderRadius.circular(15.0), // Rounded corners
    ),
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(
      vertical: 120.0, // Adjust vertical padding
      horizontal: 10.0, // Adjust horizontal padding
    ),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return "Please fill this field"; // Error message shown below the field
    }
    return null;
  },
),


                
              SizedBox(height: 60,),
              Text(
                "Sponsored by" , 
                style: yellowTitles,

              ), 

              SponsoredByWidget(),
              SizedBox(height: 30,),
              Text(
                "Social media" , 
                style: yellowTitles,

              ), 
              SizedBox(height: 20,),
              SponsoredByWidget(),
              SizedBox(height: 30,),

              Container(
                margin: EdgeInsets.only(left: 270),
                child: IconButton(
                onPressed: (){
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Schedule()),
                    );
                },
                 icon: Icon(Icons.next_plan_rounded , size: 45,) , 
                 color: Colors.white,
                 ) ,
              ) ,
            ],
            
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
}