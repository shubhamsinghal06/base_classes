import '../base_classes.dart';

mixin AfterInitMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => afterInit(context));
  }

  void afterInit(BuildContext context);
}
