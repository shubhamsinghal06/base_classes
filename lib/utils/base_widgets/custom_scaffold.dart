import '../../base_classes.dart';

/// CustomScaffold: Base class for custom scaffold
class CustomScaffold extends StatelessWidget {
  final PreferredSize appBar;
  final Color backgroundColor;
  final bool resizeToAvoidBottomPadding;
  final Widget body;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget drawer;
  final Widget floatingButton;
  final Widget bottomNav;
  final Function onWillPop;
  final bool isLoading;

  const CustomScaffold(
      {this.backgroundColor,
      @required this.body,
      this.appBar,
      this.resizeToAvoidBottomPadding,
      this.floatingButton,
      this.bottomNav,
      @required this.scaffoldKey,
      this.onWillPop,
      this.isLoading,
      this.drawer});

  /// CustomScaffold Build: Building base scaffold
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            bottomNavigationBar: bottomNav,
            key: scaffoldKey,
            drawer: drawer,
            resizeToAvoidBottomInset: resizeToAvoidBottomPadding ?? false,
            backgroundColor: backgroundColor ?? whiteColor,
            appBar: appBar,
            body: CenterProgressLoader(
                inAsyncCall: isLoading ?? false,
                progressIndicator: FadingCircle(color: blueColor, size: 25.0),
                color: Colors.transparent,
                child: body),
            floatingActionButton: floatingButton),
        onWillPop: onWillPop);
  }
}
