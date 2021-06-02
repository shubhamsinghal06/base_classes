import '../../base_classes.dart';

/// Loader Circle rotating
class LoaderCircle extends StatefulWidget {
  const LoaderCircle({
    Key? key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        super(key: key);

  final Color? color;
  final double? size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration? duration;
  final AnimationController? controller;

  @override
  _LoaderCircleState createState() => _LoaderCircleState();
}

class _LoaderCircleState extends State<LoaderCircle>
    with SingleTickerProviderStateMixin {
  final List<double> delays = [
    .0,
    -1.1,
    -1.0,
    -0.9,
    -0.8,
    -0.7,
    -0.6,
    -0.5,
    -0.4,
    -0.3,
    -0.2,
    -0.1
  ];
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox.fromSize(
            size: Size.square(widget.size!),
            child: Stack(
                children: List.generate(delays.length, (index) {
              final _position = widget.size! * .5;
              return Positioned.fill(
                  left: _position,
                  top: _position,
                  child: Transform(
                      transform: Matrix4.rotationZ(30.0 * index * 0.0174533),
                      child: Align(
                          alignment: Alignment.center,
                          child: ScaleTransition(
                              scale: DelayTween(
                                      begin: 0.0,
                                      end: 1.0,
                                      delay: delays[index])
                                  .animate(controller),
                              child: SizedBox.fromSize(
                                  size: Size.square(widget.size! * 0.15),
                                  child: _itemBuilder(index))))));
            }))));
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration:
              BoxDecoration(color: widget.color, shape: BoxShape.circle));
}
