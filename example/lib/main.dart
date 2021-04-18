import 'package:base_classes/base_classes.dart';
import 'package:base_classes/utils/after_init.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Base Classes Demo',
        theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
        home: MyHomePage(title: 'Base Classes Demo Home Page'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with AfterInitMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void afterInit(BuildContext context) {
    //get context here for init method
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: CustomAppBar(
            preferredSize: kAppbarPreferredHeight,
            title: Strings.home,
            scaffoldKey: scaffoldKey),
        resizeToAvoidBottomPadding: true,
        onWillPop: () => Future.value(false),
        isLoading: /*true*/ false,
        body: kScrollingView(Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 150.0),
              CustomText(text: Strings.ok, fontSize: size20),
              SizedBox(height: 150.0),
              CustomTextFormLabel(
                  keyBoardType: TextInputType.text,
                  labelText: Strings.enterHere,
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
              kClickAction(
                  context: context,
                  child: kNetworkCachedCircularImage(
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
        scaffoldKey: scaffoldKey);
  }
}
