import '../../base_classes.dart';

/// Custom App Bar with Base definition
class CustomAppBar extends StatelessWidget implements PreferredSize {
  final double? fontSize;
  final double? elevation;
  final FontWeight? fontWeight;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final List<Widget>? actionItems;
  final String title;
  final Size? height;
  final Widget? leading;
  final Widget? bottomLineWidget;

  CustomAppBar(
      {Key? key,
      this.elevation = 0.0,
      this.fontSize = size22,
      this.fontWeight = fontWeigh500,
      this.scaffoldKey,
      this.actionItems,
      this.height,
      required this.title,
      this.leading,
      this.bottomLineWidget})
      : preferredSize = Size.fromHeight(kAppbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: height ?? preferredSize,
        child: SafeArea(
            child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Consumer<ThemeProvider>(
                    builder: (context, model, child) => AppBar(
                        shadowColor: orangeColor2,
                        bottom: PreferredSize(
                            child: bottomLineWidget ?? Container(),
                            preferredSize: Size.fromHeight(4.0)),
                        elevation: elevation,
                        leading: leading ?? Container(),
                        actions: actionItems,
                        centerTitle: true,
                        title: CustomText(
                            text: title,
                            fontWeight: fontWeight,
                            color: model.darkTheme ? whiteColor : blackColor,
                            fontSize: fontSize!),
                        backgroundColor:
                            model.darkTheme ? blackColor : whiteColor)))));
  }

  @override
  Widget get child => Container();
}
