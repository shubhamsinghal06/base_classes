import '../base_classes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final BuildContext globalContext = navigatorKey.currentState!.context;

String kTargetPath = '';

kImageAsset(context, path,
        {width, height, color, fit = BoxFit.contain, extension = "png"}) =>
    Image.asset("assets/images/$path.$extension",
        width: width ?? null,
        height: height ?? null,
        color: color ?? null,
        fit: fit ?? null);

kAssetImage(context, path, {extension = "png"}) =>
    AssetImage('assets/images/$path.$extension');

kShowToast(
        {required context,
        required message,
        backRadius = 18.0,
        backColor = greyColor,
        fontSize = size14,
        fontWeight = fontWeigh500,
        textColor = whiteColor}) =>
    Toast.show("${message.toString()}", context,
        duration: Toast.lengthLong,
        gravity: Toast.bottom,
        backgroundRadius: backRadius,
        backgroundColor: backColor,
        textStyle: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: fontFamily,
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize));

kShowToaster(
        {required context,
        required message,
        decoration,
        icon,
        durationMilliSeconds = 2500,
        alignToast = AlignToast.top,
        fontSize = size14,
        fontWeight = fontWeigh500,
        fontColor = whiteColor}) =>
    ToastAnimate().createView(
        message: message,
        context: context,
        decoration: decoration,
        fontSize: fontSize,
        fontColor: fontColor,
        fontWeight: fontWeight,
        durationMilliSeconds: durationMilliSeconds,
        icon: icon,
        alignToast: alignToast);

kHideKeyboard(BuildContext context) =>
    FocusScope.of(context).requestFocus(FocusNode());

kRoundCorner(color,
        {background,
        borderColor,
        borderRadius = const BorderRadius.all(Radius.circular(8)),
        borderWidth = 1.0}) =>
    BoxDecoration(
        border: Border.all(color: borderColor ?? color, width: borderWidth),
        color: background ?? whiteColor,
        borderRadius: borderRadius);

kScreenHeight(BuildContext context) => MediaQuery.of(context).size.height;

kScreenWidth(BuildContext context) => MediaQuery.of(context).size.width;

kColorStatusBar(context, color) => SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: color));

kCubeLoader(context) => Consumer<ThemeProvider>(
    builder: (context, model, child) => Center(child:
            LoaderFadingCube(itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
              decoration: BoxDecoration(
                  color: model.isDarkTheme ? whiteColor : greenColor));
        })));

kThreeDotsLoader({context, color = blueColor, size = 20.0}) =>
    Consumer<ThemeProvider>(
        builder: (context, model, child) => Container(
            child: Center(
                child: LoaderThreeBounce(
                    size: size,
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                          decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(25.0)));
                    }))));

kCircularLoader({context, height = 25.0, width = 25.0, color = whiteColor}) =>
    Container(
        height: height,
        width: width,
        child: CircularProgressIndicator(
            strokeWidth: 6, valueColor: AlwaysStoppedAnimation<Color>(color)));

Future kAlertDialog(context,
        {required heading,
        required subheading,
        required firstBtnText,
        required secBtnText,
        required Function firstClick,
        required Function secondClick}) =>
    showDialog(
        context: context,
        builder: (context) => Consumer<ThemeProvider>(
            builder: (context, model, child) => AlertDialog(
                    backgroundColor: model.isDarkTheme ? greyColor : whiteColor,
                    title:
                        CustomText(text: heading, textAlign: TextAlign.start),
                    content: CustomText(
                        text: subheading, textAlign: TextAlign.start),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            firstClick();
                          },
                          child: CustomText(text: firstBtnText)),
                      TextButton(
                          onPressed: () {
                            secondClick();
                          },
                          child: CustomText(text: secBtnText))
                    ])));

kBackArrow(context, {onTap, arrowColor = blackColor}) =>
    navigationCanPop(context: context)
        ? Consumer<ThemeProvider>(
            builder: (context, model, child) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onTap,
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                        child: kImageAsset(context, 'left_arrow',
                            height: 20.0,
                            width: 20.0,
                            color: arrowColor ?? blackColor)))))
        : Container();

const kAppbarPreferredHeight = Size.fromHeight(60.0);
const kAppbarHeight = 60.0;

Future<bool> kInternetCheck() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
    return false;
  } on Exception catch (_) {
    return false;
  }
}

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

kClickActionSquash(
        {required BuildContext context,
        required Widget child,
        bool? withEffect = true,
        BorderRadius borderRadius = BorderRadius.zero,
        Color splashColor = blackColor,
        required Function onTap}) =>
    withEffect!
        ? SquashEffect(
            color: splashColor,
            borderRadius: borderRadius,
            child: child,
            onTap: () {
              kHideKeyboard(context);
              onTap();
            })
        : GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: child,
            onTap: () {
              kHideKeyboard(context);
              onTap();
            });

kPrintLog(message) => log(message ?? "");

const kBodyPadding = 20.0;

Widget kScrollingView(columnChild) => CustomScrollView(
    slivers: [SliverFillRemaining(hasScrollBody: false, child: columnChild)]);

Future<TimeOfDay?> showTimePickerDialog(context) async {
  return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 00, minute: 00),
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!));
}

Future<DateTime?> showDatePickerDialog(context) async {
  return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2101));
}

extension TimeOfDayExtension on TimeOfDay {
  int smallGreaterCompare(TimeOfDay other) {
    if (this.hour < other.hour) return -1;
    if (this.hour > other.hour) return 1;
    if (this.minute < other.minute) return -1;
    if (this.minute > other.minute) return 1;
    return 0;
  }

  int durationDiff(TimeOfDay other, int duration) {
    if (this.hour < other.hour &&
        (other.minute - this.minute).abs() == duration) return -1;
    if (this.hour > other.hour &&
        (this.minute - other.minute).abs() == duration) return 1;
    return 0;
  }
}

String timeDifference(String endedAt) {
  var endDate = DateTime.parse(endedAt).toLocal();
  var currentDate = DateTime.now();
  var difference = endDate.difference(currentDate);
  if (difference.toString().contains('-')) {
    return "00:00";
  }
  var splitArray = difference.toString().split(":");
  var timeMin = splitArray.elementAt(0);
  var timeSeconds = splitArray.elementAt(1);
  if (timeMin.length == 1) {
    timeMin = "0$timeMin";
  }
  if (timeSeconds.length == 1) {
    timeSeconds = "0$timeSeconds";
  }
  //"timeMin:$timeSeconds"
  return "$timeMin";
}

kGalleryPicker(context, {source}) => showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Container(
          child: Container(
              child: Wrap(children: <Widget>[
                Divider(height: 1.0, color: greyColor),
                ListTile(
                    leading: Icon(Icons.photo, color: greyColor),
                    title: CustomText(
                        textAlign: TextAlign.start,
                        text: Strings.image,
                        color: greyColor),
                    onTap: () => {source(0), goBack(context: context)}),
                Divider(height: 1.0, color: greyColor),
                ListTile(
                    leading:
                        Icon(Icons.video_collection_sharp, color: greyColor),
                    title: CustomText(
                        textAlign: TextAlign.start,
                        text: Strings.video,
                        color: greyColor),
                    onTap: () => {source(1), goBack(context: context)}),
                Divider(height: 1.0, color: greyColor)
              ]),
              color: whiteColor));
    });

Widget kNoDataText({required text, size = size18}) => CustomText(
    text: text,
    textAlign: TextAlign.center,
    fontWeight: fontWeigh500,
    color: greyColor1,
    fontSize: size);

kYesNoSheet(
    {required context,
    required Function yes,
    required Function no,
    required String heading,
    centerTextColor,
    btnTextYes,
    btnTextYesColor,
    btnTextNo,
    btnTextNoColor,
    btnColorYes,
    btnColorNo,
    bool showNoBtn = false,
    Function? onBackPress,
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
                                          textDecoration: TextDecoration.none,
                                          onTap: () {
                                            kHideKeyboard(context);
                                            goBack(context: ctx);
                                            return no();
                                          },
                                          text: btnTextNo ?? Strings.no,
                                          buttonColor: btnColorNo ?? greyColor1,
                                          textColor:
                                              btnTextNoColor ?? whiteColor,
                                          width: 94.0,
                                          height: 44.0),
                                    if (showNoBtn) SizedBox(width: 10.0),
                                    CustomButton(
                                        textDecoration: TextDecoration.none,
                                        onTap: () {
                                          kHideKeyboard(context);
                                          return yes();
                                        },
                                        text: btnTextYes ?? Strings.ok,
                                        buttonColor: btnColorYes ?? yellowColor,
                                        textColor:
                                            btnTextYesColor ?? whiteColor,
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
                  onBackPress!();
                  return Future.value(true);
                }));
}

kYesNoDialog(
    {required context,
    required centerText,
    required Function yes,
    required Function no,
    showNoBool = false,
    btnTextYes,
    btnTextYesColor,
    btnTextNo,
    btnTextNoColor,
    btnColorYes,
    btnColorNo,
    centerTextColor,
    isDismissible = true,
    Function? onBackPress,
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
                                      textDecoration: TextDecoration.none,
                                      width: 100.0,
                                      textColor: btnTextNoColor ?? whiteColor,
                                      height: 44.0,
                                      onTap: () {
                                        kHideKeyboard(context);
                                        return no();
                                      },
                                      text: btnTextNo ?? Strings.no,
                                      buttonColor: btnColorNo ?? orangeColor),
                                if (showNoBool) SizedBox(width: 30.0),
                                CustomButton(
                                    textDecoration: TextDecoration.none,
                                    width: 100.0,
                                    textColor: btnTextYesColor ?? whiteColor,
                                    height: 44.0,
                                    onTap: () {
                                      kHideKeyboard(context);
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
                    onBackPress!();
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

Widget kAppBarBottomLine({color = greyColor, height: 1.5}) =>
    Container(color: color.withOpacity(0.13), height: height);

TextStyle kTextStyle(
        {decoration = TextDecoration.none,
        fontFamily = fontFamily,
        color = greyColor,
        fontWeight = fontWeigh500,
        fontSize = size12}) =>
    TextStyle(
        decoration: decoration,
        fontFamily: fontFamily,
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize);
