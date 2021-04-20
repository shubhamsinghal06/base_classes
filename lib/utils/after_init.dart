import '../base_classes.dart';

/// to load context after init
mixin AfterInitMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => afterInit(context));
  }

  /// returning context
  void afterInit(BuildContext context);
}
