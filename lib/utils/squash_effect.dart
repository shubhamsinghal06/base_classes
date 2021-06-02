import 'package:base_classes/base_classes.dart';

/// creating button click squash effect on any widget
class SquashEffect extends StatefulWidget {
  SquashEffect(
      {Key? key,
      required this.onTap,
      required this.child,
      this.color,
      this.borderRadius = BorderRadius.zero})
      : super(key: key);
  final Widget child;
  final GestureTapCallback onTap;
  final Color? color;
  final BorderRadius borderRadius;

  @override
  createState() => _SquashEffectState();
}

/// creating button click squash effect on any widget
class _SquashEffectState extends State<SquashEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Tween<double> radiusTween;
  late Tween<double> borderWidthTween;
  late Animation<double> radiusAnimation;
  late Animation<double> borderWidthAnimation;
  late AnimationStatus status = AnimationStatus.dismissed;
  late Offset _tapPosition = Offset.zero;
  GlobalKey globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((AnimationStatus listener) {
            status = listener;
          });
    radiusTween = Tween<double>(begin: 0, end: 50);
    radiusAnimation = radiusTween
        .animate(CurvedAnimation(curve: Curves.ease, parent: controller));
    borderWidthTween = Tween<double>(begin: 25, end: 1);
    borderWidthAnimation = borderWidthTween
        .animate(CurvedAnimation(curve: Curves.linear, parent: controller));
  }

  void _animate() {
    controller.forward(from: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool get _enabled => true;

  void _handleTap(TapUpDetails tapDetails) {
    if (!_enabled) {
      return;
    }
    _animate();
    final renderBox = globalKey.currentContext!.findRenderObject() as RenderBox;
    _tapPosition = tapDetails.localPosition;

    var radiusParam = renderBox.size.height > renderBox.size.width
        ? renderBox.size.height
        : renderBox.size.width;
    radiusTween.end = radiusParam * 3.0;
    borderWidthTween.begin = radiusTween.end! / 2;
    borderWidthTween.end = radiusTween.end! * 0.01;
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: widget.borderRadius,
        child: CustomPaint(
            foregroundPainter: SquashPaint(
                radius: radiusAnimation.value,
                borderWidth: borderWidthAnimation.value,
                status: status,
                tapPosition: _tapPosition,
                color: widget.color ?? Colors.black),
            child: GestureDetector(
              key: globalKey,
              child: widget.child,
              onTapUp: _handleTap,
              behavior: HitTestBehavior.opaque,
            )));
  }
}

class SquashPaint extends CustomPainter {
  SquashPaint({
    required this.radius,
    required this.borderWidth,
    required this.status,
    required this.tapPosition,
    required this.color,
  }) : blackPaint = Paint()
          ..color = color.withOpacity(0.2)
          ..style = PaintingStyle.fill
          ..strokeWidth = borderWidth;

  final double radius;
  final double borderWidth;
  final AnimationStatus status;
  final Offset tapPosition;
  final Color color;
  final Paint blackPaint;

  @override
  void paint(Canvas canvas, Size size) {
    if (status == AnimationStatus.forward) {
      canvas.drawCircle(tapPosition, radius, blackPaint);
    }
  }

  @override
  bool shouldRepaint(SquashPaint oldDelegate) {
    if (radius != oldDelegate.radius) {
      return true;
    } else {
      return false;
    }
  }
}
