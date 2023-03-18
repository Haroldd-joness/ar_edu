import 'package:flutter/material.dart';

import '../constants /constants.dart';
class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  _TypingIndicatorState createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.1,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: kPriColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Opacity(
            opacity: 0.3,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: kPriColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
         const SizedBox(width: 5),
          AnimatedContainer(
            duration: const Duration(milliseconds: 1200),
            width: _controller.value * 15 + 10,
            height: 10,
            decoration: BoxDecoration(
              color: kPriColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
