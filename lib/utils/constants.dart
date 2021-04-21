import '../base_classes.dart';

/// generating global key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// generating global context
final globalContext = navigatorKey.currentState.context;

/// constant image
kImageAsset(context, path,
        {width, height, color, fit = BoxFit.contain, extension = "png"}) =>
    Image.asset("assets/images/$path.$extension",
        width: width ?? null,
        height: height ?? null,
        color: color ?? null,
        fit: fit ?? null);

/// constant asset image
kAssetImage(context, path, {extension = "png"}) =>
    AssetImage('assets/images/$path.$extension');

/// constant toast
kShowToast(
        {@required context,
        @required message,
        backRadius,
        backColor,
        textColor}) =>
    Toast.show("${message.toString()}", context,
        duration: Toast.lengthLong,
        gravity: Toast.bottomAlign,
        backgroundRadius: backRadius ?? 18.0,
        backgroundColor: backColor ?? whiteColor,
        textColor: textColor ?? whiteColor);

/// constant hide keyboard
kHideKeyboard(BuildContext context) =>
    FocusScope.of(context).requestFocus(FocusNode());

/// constant round decoration
kRoundCorner(color,
        {background,
        borderColor,
        borderRadius = const BorderRadius.all(Radius.circular(8)),
        borderWidth = 1.0}) =>
    BoxDecoration(
        border: Border.all(color: borderColor ?? color, width: borderWidth),
        color: background ?? whiteColor,
        borderRadius: borderRadius);

/// constant screen height
kScreenHeight(BuildContext context) => MediaQuery.of(context).size.height;

/// constant screen width
kScreenWidth(BuildContext context) => MediaQuery.of(context).size.width;

/// constant color of status bar
kColorStatusBar(context, color) => SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: color));

/// constant loader
kCubeLoader({context, color = greenColor}) =>
    Center(child: FadingCircle(itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(decoration: BoxDecoration(color: color));
    }));

/// constant loader
kThreeDotsLoader(context, {color = blueColor}) => Container(
    child: Center(
        child: ThreeDots(
            size: 20.0,
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(25.0)));
            })));

/// constant circular loader
kCircularLoader(context) => Container(
    height: 25,
    width: 25,
    child: CircularProgressIndicator(
        strokeWidth: 6, valueColor: AlwaysStoppedAnimation<Color>(whiteColor)));

/// constant back arrow
kBackArrow(context,
        {onTap, arrowColor = blackColor, imagePath}) =>
    GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.all(10.0),
            child: Center(
                child: kImageAsset(context, imagePath,
                    height: 20.0,
                    width: 20.0,
                    color: arrowColor ?? blackColor))));

/// constant app bar preferred height
const kAppbarPreferredHeight = Size.fromHeight(60.0);

/// constant app bar  height
const kAppbarHeight = 60.0;

/// constant network circular image
kNetworkCircularImage(context, url,
        {width = 100.0,
        height = 100.0,
        borderColor,
        bgColor,
        borderWidth = 0.0}) =>
    Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(
                color: borderColor ?? Colors.transparent, width: borderWidth),
            image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(url)),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            color: bgColor ?? Colors.transparent));

/// constant gesture detector click action
kClickAction(
        {@required BuildContext context,
        @required Widget child,
        @required Function onTap}) =>
    GestureDetector(
        child: child,
        onTap: () {
          kHideKeyboard(context);
          onTap();
        },
        behavior: HitTestBehavior.opaque);

/// constant print log
kPrintLog(message) => log(message ?? "");

/// constant body padding
const kBodyPadding = 20.0;

/// constant scrolling view insert column child
Widget kScrollingView(columnChild) => CustomScrollView(
    slivers: [SliverFillRemaining(hasScrollBody: false, child: columnChild)]);

/// constant time picker
Future<TimeOfDay> kTimePickerDialog(context) async {
  return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 00, minute: 00),
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child);
      });
}

/// constant date picker
Future<DateTime> kDatePickerDialog(context) async {
  return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2101));
}

/// constant get current time diff
String kTimeDifference(String endedAt) {
  var endDate = DateTime.parse(endedAt).toLocal();
  var currentDate = DateTime.now();
  var difference = endDate.difference(currentDate);
  if (difference.toString().contains('-')) {
    return "00:00";
  }
  var splitArray = difference.toString().split(":");
  var timeMins = splitArray.elementAt(0);
  var timeSeconds = splitArray.elementAt(1);
  if (timeMins.length == 1) {
    timeMins = "0$timeMins";
  }
  if (timeSeconds.length == 1) {
    timeSeconds = "0$timeSeconds";
  }
  //"$timeMins:$timeSeconds"
  return "$timeMins";
}

/// constant no data text
Widget kNoDataText({@required text, size = size18}) => CustomText(
    text: text,
    textAlign: TextAlign.center,
    fontWeight: fontWeigh500,
    color: greyColor1,
    fontSize: size);

/// constant yes no bottom sheet
kYesNoSheet(
    {@required context,
    @required Function yes,
    @required Function no,
    @required String heading,
    centerTextColor,
    btnTextYes,
    btnTextNo,
    btnColorYes,
    btnColorNo,
    bool showNoBtn = false,
    Function onBackPress,
    bool simpleBackPress = true}) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      backgroundColor: whiteColor,
      context: context,
      isScrollControlled: true,
      builder: (ctx) => WillPopScope(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 8.0),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(ctx).viewInsets.bottom),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 30.0),
                              CustomText(
                                  text: heading,
                                  fontSize: size18,
                                  color: centerTextColor ?? greyColor1),
                              SizedBox(height: kBodyPadding / 2),
                              SizedBox(height: 15.0),
                              Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (showNoBtn)
                                      CustomButton(
                                          onTap: () {
                                            kHideKeyboard(context);
                                            goBack(context: ctx);
                                            return no();
                                          },
                                          text: btnTextNo ?? Strings.no,
                                          buttonColor: btnColorNo ?? greyColor1,
                                          textColor: whiteColor,
                                          width: 94.0,
                                          height: 44.0),
                                    if (showNoBtn) SizedBox(width: 10.0),
                                    CustomButton(
                                        onTap: () {
                                          kHideKeyboard(context);
                                          goBack(context: ctx);
                                          return yes();
                                        },
                                        text: btnTextYes ?? Strings.ok,
                                        buttonColor: btnColorYes ?? yellowColor,
                                        textColor: whiteColor,
                                        width: 94.0,
                                        height: 44.0),
                                  ]),
                              SizedBox(height: 10.0)
                            ])),
                    SizedBox(height: 10)
                  ])),
          onWillPop: simpleBackPress
              ? () => Future.value(true)
              : () {
                  kHideKeyboard(context);
                  goBack(context: context);
                  onBackPress();
                  return Future.value(true);
                }));
}

/// constant yes no dialog
kYesNoDialog(
    {@required context,
    @required centerText,
    @required Function yes,
    @required Function no,
    showNoBool = false,
    btnTextYes,
    btnTextNo,
    btnColorYes,
    btnColorNo,
    centerTextColor,
    isDismissible = true,
    Function onBackPress,
    bool simpleBackPress = true}) {
  showGeneralDialog(
      barrierLabel: "",
      barrierDismissible: isDismissible,
      barrierColor: Colors.grey.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 300),
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return WillPopScope(
            child: Align(
                alignment: Alignment.center,
                child: Container(
                    padding: EdgeInsets.all(kBodyPadding),
                    height: 280,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: CustomText(
                                  text: centerText,
                                  color: centerTextColor ?? greyColor1,
                                  decoration: TextDecoration.none,
                                  fontSize: size18)),
                          SizedBox(height: 40.0),
                          Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                if (showNoBool)
                                  CustomButton(
                                      width: 100.0,
                                      textColor: whiteColor,
                                      height: 44.0,
                                      onTap: () {
                                        kHideKeyboard(context);
                                        goBack(context: context);
                                        return no();
                                      },
                                      text: btnTextNo ?? Strings.no,
                                      buttonColor: btnColorNo ?? orangeColor),
                                if (showNoBool) SizedBox(width: 30.0),
                                CustomButton(
                                    width: 100.0,
                                    textColor: whiteColor,
                                    height: 44.0,
                                    onTap: () {
                                      kHideKeyboard(context);
                                      goBack(context: context);
                                      return yes();
                                    },
                                    text: btnTextYes ?? Strings.yes,
                                    buttonColor: btnColorYes ?? yellowColor)
                              ]),
                        ]),
                    margin: EdgeInsets.only(
                        bottom: 0, left: kBodyPadding, right: kBodyPadding),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(15)))),
            onWillPop: simpleBackPress
                ? () => Future.value(true)
                : () {
                    kHideKeyboard(context);
                    goBack(context: context);
                    onBackPress();
                    return Future.value(true);
                  });
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
            position:
                Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
            child: child);
      });
}
