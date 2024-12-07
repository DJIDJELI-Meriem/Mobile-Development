import 'package:first_try_signup/AdminInterface/Notifications/notifications.dart';
import 'package:first_try_signup/AdminInterface/Profile/profileorg.dart';
import 'package:flutter/material.dart';



////// APP BAR
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back , color: Colors.white),
        onPressed: () {
          Navigator.pop(context); // This will navigate back to the previous page
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications , color: Colors.white),
          onPressed: () {
             Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => notificationspage()),
    );
            
          },
        ),
        IconButton(
          icon: Icon(Icons.person , color: Colors.white),
          onPressed: () {
             Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Profileorg()),
    );
          },
        ),
      ],
    );
  }
}