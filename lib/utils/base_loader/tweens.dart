import 'dart:math' as math show sin, pi;

import 'package:flutter/animation.dart';

/// DelayTween : It will execute in between animation
class DelayTween extends Tween<double> {
  DelayTween({double begin, double end, this.delay})
      : super(begin: begin, end: end);

  final double delay;

  /// DelayTween : lerp the view with mathematic
  @override
  double lerp(double t) =>
      super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  /// DelayTween : evaluation on lerp
  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
