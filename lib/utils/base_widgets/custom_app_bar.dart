import '../../base_classes.dart';

class CustomAppBar extends PreferredSize {
  final String title;
  final Widget leading;
  final Size preferredSize;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool bottomLine;

  CustomAppBar(
      {@required this.preferredSize,
      @required this.title,
      this.leading,
      this.bottomLine = false,
      this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: Container(
            margin: EdgeInsets.only(top: 10),
            child: AppBar(
                bottom: PreferredSize(
                    child: bottomLine
                        ? Container(
                            color: greyColor.withOpacity(0.13), height: 1.5)
                        : Container(),
                    preferredSize: Size.fromHeight(4.0)),
                elevation: 0,
                leading: leading ?? Container(),
                centerTitle: true,
                title: CustomText(
                    text: title, color: blackColor, fontSize: size24),
                backgroundColor: whiteColor)));
  }
}
