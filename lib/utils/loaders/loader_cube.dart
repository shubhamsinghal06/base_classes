import 'package:flutter/widgets.dart';

/// Loader cube
class LoaderCubeGrid extends StatefulWidget {
  const LoaderCubeGrid({
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
  _LoaderCubeGridState createState() => _LoaderCubeGridState();
}

class _LoaderCubeGridState extends State<LoaderCubeGrid>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  Animation<double>? anim1;
  Animation<double>? anim2;
  Animation<double>? anim3;
  Animation<double>? anim4;
  Animation<double>? anim5;

  @override
  void initState() {
    super.initState();

    controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat(reverse: true);
    anim1 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.1, 0.6, curve: Curves.easeIn)));
    anim2 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 0.7, curve: Curves.easeIn)));
    anim3 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.3, 0.8, curve: Curves.easeIn)));
    anim4 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.4, 0.9, curve: Curves.easeIn)));
    anim5 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeIn)));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
        size: Size.square(widget.size!),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _square(anim3!, 0),
                    _square(anim4!, 1),
                    _square(anim5!, 2)
                  ]),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _square(anim2!, 3),
                    _square(anim3!, 4),
                    _square(anim4!, 5)
                  ]),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _square(anim1!, 6),
                    _square(anim2!, 7),
                    _square(anim3!, 8)
                  ])
            ]));
  }

  Widget _square(Animation<double> animation, int index) {
    return ScaleTransition(
        scale: animation,
        child: SizedBox.fromSize(
            size: Size.square(widget.size! / 3), child: _itemBuilder(index)));
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(decoration: BoxDecoration(color: widget.color));
}
