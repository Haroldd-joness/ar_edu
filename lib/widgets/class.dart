import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants /constants.dart';

class Class extends StatelessWidget {
  const Class({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: kBackgroundPrimary,
        elevation: 2,
        title:   Padding(
          padding:  const EdgeInsets.all(8.0),
          child: Text("Your classes", style: kClasses,),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: kPrimaryIcons,
            child: IconButton(
              icon: const Icon(
                CupertinoIcons.bell,
                color: kIconText,
              ),
              onPressed: () {
                // Add functionality to navigate to search screen
              },
            ),
          ),
          const SizedBox(width: 10,),
          CircleAvatar(
            backgroundColor: kPrimaryIcons,
            child: IconButton(
              icon: const Icon(
                CupertinoIcons.add,
                color: kIconText,
              ),
              onPressed: () {
                // Add functionality to navigate to notifications screen
              },
            ),
          ),

          const SizedBox(width: 20,),

        ],

      ),
    );
  }
}




