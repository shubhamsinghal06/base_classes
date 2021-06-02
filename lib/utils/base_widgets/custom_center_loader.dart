import '../../base_classes.dart';

/// Custom Center Loader with Base definition
class CustomCenterLoader extends StatelessWidget {
  final Color color;
  final bool inAsyncCall;
  final bool? dismissible;
  final double? opacity;
  final Offset? offset;
  final Widget? progressIndicator;
  final Widget child;

  CustomCenterLoader({
    Key? key,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.progressIndicator = const CircularProgressIndicator(),
    this.offset,
    this.dismissible = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!inAsyncCall) return child;

    Widget layOutProgressIndicator;
    if (offset == null)
      layOutProgressIndicator = Center(child: progressIndicator);
    else {
      layOutProgressIndicator = Positioned(
          child: progressIndicator!, left: offset!.dx, top: offset!.dy);
    }

    return new Stack(children: [
      child,
      new Opacity(
          child: new ModalBarrier(dismissible: dismissible!, color: color),
          opacity: opacity!),
      layOutProgressIndicator
    ]);
  }
}
