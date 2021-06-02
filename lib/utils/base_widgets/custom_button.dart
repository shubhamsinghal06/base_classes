import '../../base_classes.dart';

/// Custom Button with container with Base definition
class CustomButton extends StatelessWidget {
  final bool? isLoading;
  final bool? withEffect;
  final Color? buttonColor;
  final Color? textColor;
  final double? height;
  final double? radius;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Function onTap;
  final FontWeight? fontWeight;
  final String text;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final Widget? progressIndicator;

  const CustomButton({
    Key? key,
    this.height,
    this.width,
    this.withEffect = true,
    required this.onTap,
    required this.text,
    this.buttonColor = whiteColor,
    this.textDecoration = TextDecoration.none,
    this.textColor = blackColor,
    this.radius = 10.0,
    this.textAlign = TextAlign.center,
    this.fontWeight = fontWeigh500,
    this.padding = EdgeInsets.zero,
    this.progressIndicator = const CircularProgressIndicator(
        strokeWidth: 6, valueColor: AlwaysStoppedAnimation<Color>(whiteColor)),
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (withEffect!) {
      return SquashEffect(
          borderRadius: BorderRadius.all(Radius.circular(radius!)),
          onTap: () {
            kHideKeyboard(context);
            onTap();
          },
          child: childWidget());
    } else {
      return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            kHideKeyboard(context);
            onTap();
          },
          child: childWidget());
    }
  }

  Widget childWidget() => Container(
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(radius!)),
          color: buttonColor),
      child: Center(
          child: isLoading!
              ? Container(height: 25, width: 25, child: progressIndicator)
              : CustomText(
                  decoration: textDecoration!,
                  text: text,
                  fontSize: size16,
                  fontWeight: fontWeight!,
                  color: textColor!,
                  textAlign: textAlign!)));
}
