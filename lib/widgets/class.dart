import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants /constants.dart';

class Class extends StatefulWidget {

  const Class({Key? key}) : super(key: key);

  @override
  State<Class> createState() => _ClassState();
}

class _ClassState extends State<Class> {
  int _currentIndex = 0;
  final List<String> _topics = [    'Animals',    'Nature',    'History',    'Architecture',    'Art',    'Science', 'Biology', 'Geography' ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: kBackgroundPrimary,
        elevation: 2,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Your classes",
            style: kClasses,
          ),
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
          const SizedBox(
            width: 10,
          ),
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
          const SizedBox(
            width: 20,
          ),
        ],
      ),
     body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: _topics.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset(
                    //   'assets/images/${_topics[index].toLowerCase()}.png',
                    //   width: 64,
                    //   height: 64,
                    // ),
                    const SizedBox(height: 8.0),
                    Text(
                      _topics[index],
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
