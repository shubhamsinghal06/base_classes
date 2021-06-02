import '../base_classes.dart';

///check if we can pop back
navigationCanPop({required context}) => Navigator.of(context).canPop();

///go back to previous screen
goBack({required BuildContext context}) {
  if (navigationCanPop(context: context)) Navigator.pop(context);
}

///go back with arguments to previous screen
goBackWithArguments({required BuildContext context, dynamic arguments}) {
  if (navigationCanPop(context: context)) Navigator.pop(context, arguments);
}

/// navigate to new screen named
navigatePushNamed(
        {required BuildContext context, required pageName, arguments}) =>
    Navigator.pushNamed(context, pageName, arguments: arguments);

/// navigate to new screen replacing current one named
navigatePushReplacementNamed(
        {required BuildContext context, pageName, arguments}) =>
    Navigator.of(context).pushReplacementNamed(pageName, arguments: arguments);

/// navigate to new screen replacing and removing until one named
navigatePushRemUntilNamedArguments(
        {required BuildContext context, required pageName, arguments}) =>
    Navigator.of(context).pushNamedAndRemoveUntil(
        pageName, (Route<dynamic> route) => false,
        arguments: arguments);

/// navigate to new screen removing all behind named
navigatePopUntilNamed({required BuildContext context, required pageName}) =>
    Navigator.of(context).popUntil(ModalRoute.withName(pageName));

/// navigate to new screen
navigatePush({required BuildContext context, required Widget pageName}) =>
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => pageName));

/// navigate to new screen with replacement
navigateWithReplacement(
        {required BuildContext context, required Widget pageName}) =>
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => pageName));

/// navigate to first screen in route
navigateToFirstRoute({required BuildContext context}) =>
    Navigator.of(context).popUntil((route) => route.isFirst);

/// navigate to custom popup
navigateToPopup(
        {required BuildContext context,
        required Widget child,
        Alignment alignment = Alignment.center,
        bool isDismissible = true}) =>
    Navigator.of(context).push(CustomPopupRoute(
        alignment: alignment,
        dismissible: isDismissible,
        builder: (BuildContext context) => child));
