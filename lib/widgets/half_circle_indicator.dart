import 'package:flutter/material.dart';

class HalfCircleIndicator extends StatelessWidget {
  final Color color;
  final double radius;

  const HalfCircleIndicator({super.key, required this.color, required this.radius});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: radius,
      child: Container(
        width: radius*2,
        height: radius,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radius*2),
            bottomRight: Radius.circular(radius*2),
          ),
        ),
      ),
    );
  }
}
