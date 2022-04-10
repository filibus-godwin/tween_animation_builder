# TweenAnimationBuilder

This app demonstrates the use of `TweenAnimationBuilder` in flutter. it makes use of a `Tween<Alignment>` to change the `end` alignment of a linear gradient.

## Tween

A tween is a stateless object that takes only `begin` and `end`. It maps from and input range to an output range.

## TweenAnimationBuilder

It is used to make custom implicit animations in flutter. It takes a `tween` property which provides the mapping from an input range to an output range, a `duration` property which is used to specify the duration of the animation and it also takes a `builder` property. The builder property is called each time the animation updates. The builder property is a callback provides the context, the tween value and the optional child, which can be used for perfomance optimization.

```dart
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
```

The code snippet above is show a typical example of the use of a TweenAnimationBuilder.
