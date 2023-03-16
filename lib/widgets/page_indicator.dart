import 'package:flutter/material.dart';

import '../constants /constants.dart';

AnimatedContainer buildDot(int index, int currentPageIndex) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 800),
    margin: const EdgeInsets.symmetric(horizontal: 8),
    height: currentPageIndex == index ? 16 : 8,
    width: currentPageIndex == index ? 16 : 8,

    decoration: BoxDecoration(
      color: currentPageIndex == index ? kSecondaryColor : Colors.grey,
      borderRadius: BorderRadius.circular(12),
    ),
  );
}