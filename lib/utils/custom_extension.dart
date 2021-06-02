import '../base_classes.dart';

/// multiple variable check extensions
extension VariablesExtension on dynamic {
  int get checkInt => (this != null)
      ? (this is int)
          ? this
          : (this is double)
              ? this.toInt()
              : (this is String)
                  ? int.parse(this)
                  : 0
      : 0;

  double get checkDouble => (this != null)
      ? (this is double)
          ? this
          : (this is int)
              ? this.toDouble()
              : (this is String)
                  ? double.parse(this)
                  : 0.0
      : 0.0;

  String get checkString => (this != null) ? this.toString() : '';

  String get toNullString => (this != null) ? this.toString() : '';

  dynamic get getPageArguments => ModalRoute.of(this)!.settings.arguments;

  dynamic get getCurrentPath => ModalRoute.of(this)!.settings.name;
}

/// CAPS on string
extension StringCapsExtension on String {
  String get capsFirstLetter => "${this[0].toUpperCase()}${this.substring(1)}";

  String get capsAllWord =>
      this.split(" ").map((str) => str.capsFirstLetter).join(" ");
}

/// modifying json
extension JsonToResponse on Map {
  dynamic get parseToRes => this[Strings.bodyFcmKey][Strings.dataFcmKey];
}

/// parsing json
extension JSONToMessage on Map {
  dynamic get parseToMessage => this[Strings.messageKey];
}

/// list of widgets
extension ListWidgetCreate on List<String> {
  List<Widget> get getWidgets =>
      this.map((element) => CustomText(text: element)).toList();
}

/// extensions on widgets
extension WidgetExtension on Widget {
  Widget padAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget padHorizontal(double padding) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: padding), child: this);

  Widget padVertical(double padding) =>
      Padding(padding: EdgeInsets.symmetric(vertical: padding), child: this);

  Widget padOnly({l = 0.0, r = 0.0, t = 0.0, b = 0.0}) => Padding(
      padding: EdgeInsets.only(left: l, right: r, top: t, bottom: b),
      child: this);

  Widget get center => Center(child: this);

  Widget get alignTopRight => Align(child: this, alignment: Alignment.topRight);

  Widget get alignTopCenter =>
      Align(child: this, alignment: Alignment.topCenter);

  Widget get alignBottomRight =>
      Align(child: this, alignment: Alignment.bottomRight);

  Widget get alignBottomCenter =>
      Align(child: this, alignment: Alignment.bottomCenter);

  Widget get alignCenterRight =>
      Align(child: this, alignment: Alignment.centerRight);

  Widget get alignTopLeft => Align(child: this, alignment: Alignment.topLeft);

  Widget get alignBottomLeft =>
      Align(child: this, alignment: Alignment.bottomLeft);

  Widget get alignCenterLeft =>
      Align(child: this, alignment: Alignment.centerLeft);

  Widget get alignCenter => Align(child: this, alignment: Alignment.center);
}
