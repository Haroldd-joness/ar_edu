import 'package:flutter/material.dart';

class OnBoardContents {
  final String image;
  final String title;
  final String description;
  String _buttonText;

  OnBoardContents({
    required this.image,
    required this.title,
    required this.description,
    required String buttonText,
  }) : _buttonText = buttonText;

  String get buttonText => _buttonText;

  set buttonText(String value) {
    _buttonText = value;
  }
}

List<OnBoardContents> contents = [
  OnBoardContents(
    title: 'Welcome to AR Edu',
    image: 'assets/images/AR.png',
    description:
        'AR Edu is the one-stop platform for students and teachers to enjoy learning in 3D & Augmented Reality',
    buttonText: '',
  ),
  OnBoardContents(
      title: 'Interactive Lessons',
      image: 'assets/images/AR2.png',
      description:
          'Find dozens of lesson plans, modules, and educational contents in 3D & AR - all in one place.',
      buttonText: ''),
  OnBoardContents(
    title: 'Classrooms',
    image: 'assets/images/book.png',
    description:
        "Set up classes according to subjects, so it's easy for everyone to share work's, find things, and see what s going on.",
    buttonText: '',
  ),
  OnBoardContents(
      title: 'Ready to use?',
      image: 'assets/images/AR2.png',
      description: "Set up classes according to subjects, so it's easy for everyone to share work's, find things, and see what s going on.",
      buttonText: ''),
];
