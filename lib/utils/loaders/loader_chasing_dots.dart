import '../../base_classes.dart';

/// Loader for three dot
class LoaderChasingDots extends StatefulWidget {
  const LoaderChasingDots({
    Key? key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 2000),
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        super(key: key);

  final Color? color;
  final double? size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration? duration;

  @override
  _LoaderChasingDotsState createState() => _LoaderChasingDotsState();
}

class _LoaderChasingDotsState extends State<LoaderChasingDots>
    with TickerProviderStateMixin {
  late AnimationController scaleCtrl;
  late AnimationController rotateCtrl;
  Animation<double>? scale;
  Animation<double>? rotate;

  @override
  void initState() {
    super.initState();

    scaleCtrl = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(() => setState(() {}))
      ..repeat(reverse: true);
    scale = Tween(begin: -1.0, end: 1.0)
        .animate(CurvedAnimation(parent: scaleCtrl, curve: Curves.easeInOut));

    rotateCtrl = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(() => setState(() {}))
      ..repeat();
    rotate = Tween(begin: 0.0, end: 360.0)
        .animate(CurvedAnimation(parent: rotateCtrl, curve: Curves.linear));
  }

  @override
  void dispose() {
    scaleCtrl.dispose();
    rotateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox.fromSize(
            size: Size.square(widget.size!),
            child: Transform.rotate(
                angle: rotate!.value * 0.0174533,
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 0.0, child: _circle(1.0 - scale!.value.abs(), 0)),
                  Positioned(bottom: 0.0, child: _circle(scale!.value.abs(), 1))
                ]))));
  }

  Widget _circle(double scale, int index) {
    return Transform.scale(
        scale: scale,
        child: SizedBox.fromSize(
            size: Size.square(widget.size! * 0.6),
            child: widget.itemBuilder != null
                ? widget.itemBuilder!(context, index)
                : DecoratedBox(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: widget.color))));
  }
}
