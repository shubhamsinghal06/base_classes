import '../../base_classes.dart';

///Custom popup transition
class CustomPopupRoute extends PopupRoute {
  CustomPopupRoute({
    this.alignment = Alignment.center,
    required this.builder,
    required this.dismissible,
    RouteSettings? setting,
  }) : super(settings: setting);

  final Alignment alignment;
  final bool dismissible;
  final WidgetBuilder builder;

  @override
  Color get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => dismissible;

  @override
  String get barrierLabel => '';

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 500);

  @override
  Curve get barrierCurve => Curves.linear;

  @override
  Future<RoutePopDisposition> willPop() => dismissible
      ? Future.value(RoutePopDisposition.pop)
      : Future.value(RoutePopDisposition.doNotPop);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Semantics(
        child: SafeArea(child: Builder(builder: (BuildContext context) {
          final Widget child = Builder(builder: builder);
          return child;
        })),
        scopesRoute: true,
        explicitChildNodes: true);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
        position: Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
            .animate(animation),
        child: MediaQuery.removeViewInsets(
            removeLeft: true,
            removeTop: true,
            removeRight: true,
            removeBottom: true,
            context: context,
            child: Align(child: child, alignment: alignment)));
  }
}
