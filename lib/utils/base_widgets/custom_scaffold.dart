import 'package:base_classes/utils/base_loader/loaders/fading_circle.dart';

import '../../base_classes.dart';

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            bottomNavigationBar: bottomNav,
            key: scaffoldKey,
            drawer: drawer,
            resizeToAvoidBottomPadding: resizeToAvoidBottomPadding ?? false,
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