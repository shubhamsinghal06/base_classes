import 'package:base_classes/base_classes.dart';

enum AlignToast { top, bottom }

/// Toast animate
class ToastAnimate {
  static final ToastAnimate instance = new ToastAnimate.internal();

  factory ToastAnimate() {
    return instance;
  }

  ToastAnimate.internal();

  OverlayState? overlayState;
  OverlayEntry? overlayEntry;
  bool isVisible = false;

  Future createView(
      {required String message,
      required BuildContext context,
      BoxDecoration? decoration,
      AlignToast alignToast = AlignToast.top,
      double fontSize = size14,
      Widget? icon,
      FontWeight fontWeight = fontWeigh500,
      Color fontColor = whiteColor,
      int durationMilliSeconds = 2500}) async {
    if (isVisible) {
      return;
    }
    isVisible = true;
    overlayState = Overlay.of(context)!;
    overlayEntry = OverlayEntry(
        builder: (BuildContext context) => Positioned(
              child: SafeArea(
                  child: ToastAnimateState(
                alignToast: alignToast,
                fontWeight: fontWeight,
                icon: icon,
                endTween: alignToast == AlignToast.top ? 10.0 : -10.0,
                startTween: alignToast == AlignToast.top ? -5.0 : 5.0,
                fontSize: fontSize,
                fontColor: fontColor,
                decoration: decoration,
                message: message,
                durationSeconds: durationMilliSeconds,
                removeWidget: () {
                  if (overlayState != null) {
                    if (overlayEntry != null && overlayEntry!.mounted) {
                      overlayEntry!.remove();
                      isVisible = false;
                    }
                  }
                },
              )),
              top: alignToast == AlignToast.top
                  ? MediaQuery.of(context).viewInsets.top + 5
                  : null,
              bottom: alignToast == AlignToast.bottom
                  ? MediaQuery.of(context).viewInsets.bottom + 20
                  : null,
              key: UniqueKey(),
            ));
    overlayState!.insert(overlayEntry!);
  }
}

/// Toast singleton
class ToastAnimateState extends StatefulWidget {
  final AlignToast? alignToast;
  final BoxDecoration? decoration;
  final Color fontColor;
  final double fontSize;
  final double startTween;
  final double endTween;
  final Function? removeWidget;
  final FontWeight fontWeight;
  final int durationSeconds;
  final String message;
  final Widget? icon;

  const ToastAnimateState(
      {required this.message,
      required this.removeWidget,
      required this.alignToast,
      this.decoration,
      this.icon,
      required this.fontSize,
      required this.startTween,
      required this.endTween,
      required this.fontWeight,
      required this.fontColor,
      required this.durationSeconds});

  @override
  createState() => ToastAnimateStateState();
}

class ToastAnimateStateState extends State<ToastAnimateState> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: TweenAnimationBuilder(
            duration: Duration(milliseconds: 300),
            tween: Tween(begin: widget.startTween, end: widget.endTween),
            builder: (context, double value, child) {
              if (widget.alignToast == AlignToast.top) {
                if (value < (widget.endTween / 2).checkInt) {
                  return Transform.translate(
                      offset: Offset(0, value), child: childWidget());
                } else {
                  var negateValue = widget.endTween - value.checkInt;
                  if (negateValue == 0.0) {
                    Future.delayed(
                            Duration(milliseconds: widget.durationSeconds))
                        .whenComplete(() => widget.removeWidget!());
                  }
                  return Transform.translate(
                      offset: Offset(0, negateValue), child: childWidget());
                }
              } else {
                if (value > (widget.endTween / 2).checkInt) {
                  return Transform.translate(
                      offset: Offset(0, value), child: childWidget());
                } else {
                  var positiveValue = widget.endTween - value.checkInt;
                  if (positiveValue == 0.0) {
                    Future.delayed(
                            Duration(milliseconds: widget.durationSeconds))
                        .whenComplete(() => widget.removeWidget!());
                  }
                  return Transform.translate(
                      offset: Offset(0, positiveValue), child: childWidget());
                }
              }
            }));
  }

  Widget childWidget() => Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      width: kScreenWidth(context) * 0.95,
      decoration: widget.decoration ??
          BoxDecoration(
              color: greenColor, borderRadius: BorderRadius.circular(10.0)),
      child: Row(children: [
        Flexible(
            child: Center(
                child: widget.icon ??
                    Icon(Icons.info, color: whiteColor, size: 20.0)),
            flex: 2),
        Expanded(
            flex: 8,
            child: CustomText(
                    textAlign: TextAlign.start,
                    softWrap: true,
                    maxLines: 5,
                    text: widget.message,
                    color: widget.fontColor,
                    fontSize: widget.fontSize,
                    fontWeight: widget.fontWeight,
                    decoration: TextDecoration.none)
                .padOnly(l: 5.0, r: 5.0, t: 20.0, b: 20.0)),
      ], mainAxisSize: MainAxisSize.max));
}
