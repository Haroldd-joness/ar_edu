import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  final Color color;

  const LoadingIndicator({Key? key, this.color = Colors.grey}) : super(key: key);

  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _circle(0),
        SizedBox(width: 8.0),
        _circle(1),
        SizedBox(width: 8.0),
        _circle(2),
      ],
    );
  }

  Widget _circle(int index) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _animation.value < 0.3
              ? 0.3
              : (_animation.value < 0.6 ? 0.6 : _animation.value),
          child: Container(
            width: 12.0,
            height: 12.0,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(6.0),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: _animation.value * 16.0 * (index + 1),
            ),
          ),
        );
      },
    );
  }
}
