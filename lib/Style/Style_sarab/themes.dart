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
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications , color: Colors.white),
          onPressed: () {
            print('Notifications clicked');
          },
        ),
        IconButton(
          icon: Icon(Icons.person , color: Colors.white),
          onPressed: () {
            print('Profile clicked');
          },
        ),
      ],
    );
  }
}