import '../base_classes.dart';

goBack({@required BuildContext context}) {
  if (navigationCanPop(context: context)) Navigator.pop(context);
}

navigateToFirstRoute({@required BuildContext context}) =>
    Navigator.of(context).popUntil((route) => route.isFirst);

navigatePushNamed(
        {@required BuildContext context, @required pageName, arguments}) =>
    Navigator.pushNamed(context, pageName, arguments: arguments);

navigatePushReplacementNamed(
        {@required BuildContext context, pageName, arguments}) =>
    Navigator.of(context).pushReplacementNamed(pageName, arguments: arguments);

navigatePushRemovedUntil(
        {@required BuildContext context, @required pageName, arguments}) =>
    Navigator.of(context).pushNamedAndRemoveUntil(
        pageName, (Route<dynamic> route) => false,
        arguments: arguments);

navigatePopNamed({@required BuildContext context, @required pageName}) =>
    Navigator.pop(context, pageName);

navigationCanPop({@required context}) => Navigator.of(context).canPop();

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

navigateToPage({
  @required BuildContext context,
  @required Widget pageName,
}) =>
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => pageName));

popUntilToPage({@required BuildContext context, @required pageName}) =>
    Navigator.of(context).popUntil(ModalRoute.withName(pageName));
