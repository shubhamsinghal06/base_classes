import '../../base_classes.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double radius;
  final double width;
  final Function onTap;
  final Color buttonColor;
  final Color textColor;
  final String text;
  final EdgeInsetsGeometry padding;
  final isLoading;

  const CustomButton({
    Key key,
    this.height,
    this.width,
    @required this.onTap,
    @required this.text,
    this.buttonColor,
    this.textColor,
    this.radius,
    this.padding,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          kHideKeyboard(context);
          onTap();
        },
        child: Container(
            padding: padding ?? EdgeInsets.zero,
            width: width,
            height: height,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 20)),
                color: buttonColor ?? whiteColor),
            child: Center(
                child: isLoading
                    ? kCircularLoader(context)
                    : CustomText(
                        text: text,
                        fontSize: 16.0,
                        fontWeight: fontWeigh500,
                        color: textColor ?? blackColor,
                        textAlign: TextAlign.center))));
  }
}
