import '../../base_classes.dart';

/// CustomText : Base Class for all styles of text
class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final int maxLines;
  final TextAlign textAlign;
  final TextDecoration decoration;
  final EdgeInsetsGeometry padding;

  const CustomText({
    Key key,
    this.text,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
    this.decoration,
    this.padding,
  }) : super(key: key);

  /// CustomText Build: building view for texts
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Text(text ?? "",
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                decoration: decoration,
                fontFamily: fontFamily,
                color: color ?? blackColor,
                fontWeight: fontWeight ?? fontWeigh400,
                fontSize: fontSize ?? size16),
            textAlign: textAlign ?? TextAlign.center));
  }
}
