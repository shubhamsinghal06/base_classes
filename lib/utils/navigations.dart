import '../base_classes.dart';

/// go back
goBack({@required BuildContext context}) {
  if (navigationCanPop(context: context)) Navigator.pop(context);
}

/// nav to first page
navigateToFirstRoute({@required BuildContext context}) =>
    Navigator.of(context).popUntil((route) => route.isFirst);

/// nav forward
navigatePushNamed(
        {@required BuildContext context, @required pageName, arguments}) =>
    Navigator.pushNamed(context, pageName, arguments: arguments);

/// nav forward with replacing current
navigatePushReplacementNamed(
        {@required BuildContext context, pageName, arguments}) =>
    Navigator.of(context).pushReplacementNamed(pageName, arguments: arguments);

/// nav forward with after removing all of current
navigatePushRemovedUntil(
        {@required BuildContext context, @required pageName, arguments}) =>
    Navigator.of(context).pushNamedAndRemoveUntil(
        pageName, (Route<dynamic> route) => false,
        arguments: arguments);

/// nav back removing current
navigatePopNamed({@required BuildContext context, @required pageName}) =>
    Navigator.pop(context, pageName);

/// check if can pop
navigationCanPop({@required context}) => Navigator.of(context).canPop();

/// nav by removing current
navigateWithReplacement({
  @required BuildContext context,
  @required Widget pageName,
}) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => pageName,
    ),
  );
}

/// nav forward
navigateToPage({
  @required BuildContext context,
  @required Widget pageName,
}) =>
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => pageName));

/// GO BACK TO ANY SPECIFIC existing SCREEN
popUntilToPage({@required BuildContext context, @required pageName}) =>
    Navigator.of(context).popUntil(ModalRoute.withName(pageName));
