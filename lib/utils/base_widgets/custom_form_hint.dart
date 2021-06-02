import '../../base_classes.dart';

/// Custom TextFormField with Hint
class CustomFormHint extends StatelessWidget {
  final bool? obscureText;
  final Color? borderColor;
  final Color? fillColor;
  final Color? textColor;
  final Color? containerBorderColor;
  final Color? primaryColor;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? containerBorderRadius;
  final double? textHeight;
  final EdgeInsetsGeometry? padding;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final String? Function(String?)? onChanged;
  final FocusNode? focus;
  final InputBorder? allSideBorders;
  final int? maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatter;
  final String? initialValue;
  final String highlightText;
  final TextAlign? textAlign;
  final TextEditingController? controller;
  final TextInputType keyBoardType;
  final TextInputAction? textInputAction;
  final Widget? suffix;
  final Widget? prefix;

  const CustomFormHint({
    Key? key,
    this.obscureText = false,
    required this.keyBoardType,
    required this.highlightText,
    this.validator,
    this.fontSize,
    this.primaryColor,
    this.textHeight = 1.0,
    this.fillColor = whiteColor,
    this.onSaved,
    this.borderColor,
    this.textColor = blackColor,
    this.maxLines = 1,
    this.height,
    this.width,
    this.textAlign = TextAlign.start,
    this.padding,
    this.maxLength,
    this.inputFormatter,
    this.allSideBorders = const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent)),
    this.onChanged,
    this.controller,
    this.initialValue,
    this.suffix,
    this.prefix,
    this.containerBorderColor = greyColor,
    this.containerBorderRadius = 8.0,
    this.focus,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, model, child) => Theme(
            data: Theme.of(context)
                .copyWith(primaryColor: primaryColor ?? greyColor),
            child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    border: Border.all(color: containerBorderColor!),
                    color: Colors.transparent,
                    borderRadius:
                        BorderRadius.circular(containerBorderRadius!)),
                margin: EdgeInsets.only(bottom: 10.0),
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 3.5),
                child: TextFormField(
                    focusNode: focus,
                    textInputAction: textInputAction,
                    initialValue: initialValue,
                    inputFormatters: inputFormatter,
                    maxLength: maxLength,
                    maxLines: maxLines,
                    keyboardType: keyBoardType,
                    obscureText: obscureText!,
                    textAlign: textAlign!,
                    style: TextStyle(
                        fontSize: fontSize,
                        fontFamily: fontFamily,
                        color: model.darkTheme ? whiteColor : textColor),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: fillColor,
                        suffixIcon: suffix,
                        prefixIcon: prefix,
                        hintText: highlightText,
                        hintStyle: TextStyle(
                            height: textHeight,
                            fontFamily: fontFamily,
                            fontStyle: FontStyle.normal,
                            color: model.darkTheme ? whiteColor : greyColor),
                        focusedBorder: allSideBorders,
                        border: allSideBorders,
                        enabledBorder: allSideBorders,
                        disabledBorder: allSideBorders,
                        counterText: '',
                        counterStyle: TextStyle(fontSize: 0)),
                    validator: validator,
                    onSaved: onSaved,
                    onChanged: onChanged,
                    controller: controller))));
  }
}
