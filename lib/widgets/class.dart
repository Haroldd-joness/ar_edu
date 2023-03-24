import 'dart:math';

import 'package:ar_edu/models%20/topic_models.dart';
import 'package:ar_edu/screens/ar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants /constants.dart';

class Class extends StatefulWidget {

  const Class({Key? key}) : super(key: key);

  @override
  State<Class> createState() => _ClassState();
}

class _ClassState extends State<Class> {

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
            "All Topics",
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
          itemCount: Topics.samples.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/ARCore'),
              child: buildCard(Topics.samples[index], index)
            );
          },
        ),
      ),
    );
  }
static  const List<Color> kCardColor = [kCardBlue, kCardNavy, kCardPink, kCardYellow];

  Widget buildCard(Topics topics, int index){
    return Container(

      //elevation: 2,
      decoration: BoxDecoration(
        color: kCardColor[index % kCardColor.length],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(width: 130, image: AssetImage(
            topics.imageUrl,
          ),),
          const SizedBox(height: 8.0),
          Text(
            topics.label,
            style:  GoogleFonts.poppins(
              fontSize: 18.0,
              color: kSecondaryTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

}
