import '../../base_classes.dart';

/// Custom text view
class CustomText extends StatelessWidget {
  final Color? color;
  final bool softWrap;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final FontWeight? fontWeight;
  final int? maxLines;
  final String text;
  final TextAlign? textAlign;
  final TextDecoration? decoration;

  const CustomText({
    Key? key,
    required this.text,
    this.color = blackColor,
    this.softWrap = false,
    this.maxLines,
    this.fontWeight = fontWeigh400,
    this.fontSize = size16,
    this.textAlign = TextAlign.center,
    this.decoration,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, model, child) => Padding(
            padding: padding ?? EdgeInsets.zero,
            child: Text(text,
                maxLines: maxLines,
                softWrap: softWrap,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    decoration: decoration,
                    fontFamily: fontFamily,
                    color: model.darkTheme ? whiteColor : color,
                    fontWeight: fontWeight,
                    fontSize: fontSize),
                textAlign: textAlign)));
  }
}
