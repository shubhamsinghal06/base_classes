import 'package:base_classes/base_classes.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Strings.countryCode = Strings.countryCodeIndia;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        key: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Base Classes Demo',
        theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
        home: MyHomePage(title: 'Base Classes Demo Home Page'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with OnInit {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void afterFirstLayout(BuildContext context) {
    //get context here for init method
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: CustomAppBar(
            leading: kBackArrow(context, onTap: () {}, arrowColor: blackColor),
            height: kAppbarPreferredHeight,
            title: Strings.home,
            scaffoldKey: scaffoldKey),
        resizeToAvoidBottomPadding: true,
        onWillPop: () => Future.value(false),
        // make it true to enable back button android
        isLoading: /*true*/ false,
        // make it true to enable loader
        body: Container(
            child: kScrollingView(Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 150.0),
                  CustomText(text: Strings.ok, fontSize: size20),
                  SizedBox(height: 150.0),
                  CustomFormLabel(
                      keyBoardType: TextInputType.text,
                      highlightText: Strings.enterHere,
                      textInputAction: TextInputAction.done),
                  SizedBox(height: 150.0),
                  CustomButton(
                      onTap: () {
                        kYesNoSheet(
                            context: context,
                            yes: () {},
                            no: () {},
                            heading: Strings.home);
                      },
                      text: Strings.submit,
                      textColor: whiteColor,
                      width: 150.0,
                      height: 55.0,
                      buttonColor: orangeColor),
                  SizedBox(height: 150.0),
                  kClickActionSquash(
                      context: context,
                      child: kNetworkCircularImage(
                          context, Strings.dummyImageURL,
                          height: 150.0, width: 150.0),
                      onTap: () {
                        kYesNoDialog(
                            context: context,
                            yes: () {},
                            no: () {},
                            centerText: Strings.home);
                      }),
                  SizedBox(height: 150.0),
                ])),
            margin: EdgeInsets.symmetric(horizontal: kBodyPadding)),
        scaffoldKey: scaffoldKey);
  }
}
