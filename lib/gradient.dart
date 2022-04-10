import 'package:flutter/material.dart';

class GradientCircle extends StatefulWidget {
  const GradientCircle({Key? key}) : super(key: key);

  @override
  State<GradientCircle> createState() => _GradientCircleState();
}

class _GradientCircleState extends State<GradientCircle> {
  Tween<Alignment> alignmentTween =
      Tween<Alignment>(begin: Alignment.topCenter, end: Alignment.bottomLeft);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: alignmentTween,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 3),
      builder:
          (BuildContext context, AlignmentGeometry alignment, Widget? widget) {
        return Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            color: Colors.blue,
            gradient: LinearGradient(
              colors: const [
                Colors.pink,
                Colors.purple,
              ],
              begin: Alignment.bottomCenter,
              end: alignment,
              stops: const [0.2, 0.1],
            ),
          ),
        );
      },
    );
  }
}
