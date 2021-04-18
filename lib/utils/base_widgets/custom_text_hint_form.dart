import '../../base_classes.dart';

class CustomTextFormHint extends StatelessWidget {
  final double height;
  final double width;
  final double fontSize;
  final String initialValue;
  final String hintText;
  final Function validator;
  final bool obscureText;
  final Color borderColor;
  final Color fillColor;
  final int maxLines;
  final int maxLength;
  final List<TextInputFormatter> inputFormatter;
  final EdgeInsetsGeometry padding;
  final TextAlign textAlign;
  final TextInputType keyBoardType;
  final Function onSaved;
  final Function onChanged;
  final TextEditingController controller;
  final Widget suffix;
  final TextInputAction textInputAction;
  final InputBorder allSideBorders;
  final FocusNode focus;
  final Color containerBorderColor;
  final double containerBorderRadius;

  const CustomTextFormHint({
    Key key,
    this.obscureText = false,
    @required this.keyBoardType,
    @required this.hintText,
    this.validator,
    this.fontSize,
    this.fillColor = whiteColor,
    this.onSaved,
    this.borderColor,
    this.maxLines,
    this.height,
    this.width,
    this.textAlign,
    this.padding,
    this.maxLength,
    this.inputFormatter,
    this.allSideBorders = const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent)),
    this.onChanged,
    this.controller,
    this.initialValue,
    this.suffix,
    this.containerBorderColor = greyColor,
    this.containerBorderRadius = 8.0,
    this.focus,
    @required this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(color: containerBorderColor),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(containerBorderRadius)),
        margin: EdgeInsets.only(bottom: 10.0),
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 3.0),
        child: TextFormField(
            focusNode: focus,
            textInputAction: textInputAction ?? TextInputAction.done,
            initialValue: initialValue,
            inputFormatters: inputFormatter,
            maxLength: maxLength,
            maxLines: maxLines ?? 1,
            keyboardType: keyBoardType,
            obscureText: obscureText,
            textAlign: textAlign ?? TextAlign.start,
            style: TextStyle(
                fontSize: fontSize, fontFamily: fontFamily, color: blackColor),
            decoration: InputDecoration(
                filled: true,
                fillColor: fillColor,
                suffixIcon: suffix,
                hintText: hintText,
                hintStyle: TextStyle(
                    height: 1.0,
                    fontFamily: fontFamily,
                    fontStyle: FontStyle.normal,
                    color: greyColor),
                focusedBorder: allSideBorders,
                border: allSideBorders,
                enabledBorder: allSideBorders,
                disabledBorder: allSideBorders,
                counterText: '',
                counterStyle: TextStyle(fontSize: 0)),
            validator: validator,
            onSaved: onSaved,
            onChanged: onChanged,
            controller: controller));
  }
}
