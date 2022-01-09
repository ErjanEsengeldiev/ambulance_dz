import 'package:flutter/material.dart';

class SinginConfirmationCodeModel extends ChangeNotifier {

  bool obscureText = true;
  IconData suffixIcon = Icons.visibility;
  void lookPassword() {
    suffixIcon == Icons.visibility
        ? suffixIcon = Icons.visibility_off
        : suffixIcon = Icons.visibility;
    obscureText == true ? obscureText = false : obscureText = true;
    notifyListeners();
  }

  void chekCode(BuildContext context) {
    context.dependOnInheritedWidgetOfExactType<SinginConfirmationCodeProvider>()?.codeFromSMS;
  }
}

class SinginConfirmationCodeProvider extends InheritedNotifier {
  final int codeFromSMS;
  final SinginConfirmationCodeModel model;
  // ignore: use_key_in_widget_constructors
  const SinginConfirmationCodeProvider(
      {required Widget child, required this.model, required this.codeFromSMS})
      : super(
          child: child,
          notifier: model,
        );

  static SinginConfirmationCodeProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SinginConfirmationCodeProvider>();
  }

  static SinginConfirmationCodeProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<
            SinginConfirmationCodeProvider>()
        ?.widget;
    return widget is SinginConfirmationCodeProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant SinginConfirmationCodeProvider oldWidget) {
    return true;
  }
}
