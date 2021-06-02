import '../../base_classes.dart';

/// Custom base scaffold
class CustomScaffold extends StatelessWidget {
  final bool? resizeToAvoidBottomPadding;
  final bool? isLoading;
  final Color? backgroundColor;
  final Future<bool> Function()? onWillPop;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PreferredSize? appBar;
  final Widget body;
  final Widget? drawer;
  final Widget? floatingButton;
  final Widget? bottomNav;
  final Widget? progressIndicator;

  const CustomScaffold(
      {Key? key,
      this.backgroundColor = whiteColor,
      required this.body,
      this.appBar,
      this.resizeToAvoidBottomPadding,
      this.floatingButton,
      this.bottomNav,
      required this.scaffoldKey,
      this.onWillPop,
      this.progressIndicator =
          const LoaderFadingCube(color: blueColor, size: 25.0),
      this.isLoading = false,
      this.drawer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, model, child) => WillPopScope(
            child: Scaffold(
                bottomNavigationBar: bottomNav,
                key: scaffoldKey,
                drawer: drawer,
                resizeToAvoidBottomInset: resizeToAvoidBottomPadding ?? false,
                backgroundColor: model.darkTheme ? blackColor : backgroundColor,
                appBar: appBar,
                body: SafeArea(
                    child: CustomCenterLoader(
                        inAsyncCall: isLoading!,
                        progressIndicator: progressIndicator,
                        color: Colors.transparent,
                        child: body)),
                floatingActionButton: floatingButton),
            onWillPop: onWillPop));
  }
}
