import 'package:flutter/material.dart';

import '../constants /constants.dart';

class GetStarted extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final Color color;

  // ignore: use_key_in_widget_constructors
  const GetStarted(
      {required this.title,
      required this.height,
      required this.width,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: kButtonText,
          )
        ],
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  final String title;

  final double height;
  final double width;
  final Color color;


  // ignore: use_key_in_widget_constructors
  const SignUp(
      {required this.title,
        required this.height,
        required this.width,
        required this.color, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        height: height,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: kButtonText,
            )
          ],
        ),
      ),
    );
  }
}