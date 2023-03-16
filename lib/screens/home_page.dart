
import 'package:ar_edu/constants%20/constants.dart';
import 'package:ar_edu/widgets/scan.dart';
import 'package:ar_edu/widgets/class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/chat.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    const Class(),
    const Scan(),
    const ChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.grey,

          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },

          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_2),
              label: 'Class',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.camera_viewfinder),
              label: 'Scan',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2),
              label: 'Chat',
            ),
          ],
        ),
      ),
    );
  }
  }


