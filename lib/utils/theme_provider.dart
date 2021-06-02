import '../base_classes.dart';

/// dummy class to create custom themes
class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    // isDarkTheme = Pref.getBool(IS_DARK_THEME);
  }

  bool isDarkTheme = false;

  bool get darkTheme => isDarkTheme;

  set darkTheme(bool value) {
    isDarkTheme = value;
    notifyListeners();
  }
}
