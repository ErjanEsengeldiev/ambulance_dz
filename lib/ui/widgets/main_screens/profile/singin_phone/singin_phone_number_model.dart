import 'dart:math';
import 'package:ambulance/ui/widgets/main_screens/profile/singin_confirmation_code/singin_confirmation_code.dart';
import 'package:flutter/material.dart';

class SinginPhoneRegistModel extends ChangeNotifier {
  var phoneNumber = '';
  String? erorText;
  RegExp regexp = RegExp(r'(^(?:[+0]9)?[0-9]{9,12}$)');

  void refreshTextFild() {
    erorText = null;
    notifyListeners();
  }

  void phoneRegist(BuildContext context) {
    regexp.hasMatch(phoneNumber)
        ? {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SinginConfirmationCode(
                  number:phoneNumber ,
                      codeFromSMS: Random().nextInt(9999),
                    ))),
          }
        : erorText = 'Вы ввели не правильный номер';
    notifyListeners();
  }
}

class SinginPhoneRegistProvider extends InheritedNotifier {
  final SinginPhoneRegistModel model;
  // ignore: use_key_in_widget_constructors
  const SinginPhoneRegistProvider({required Widget child, required this.model})
      : super(
          child: child,
          notifier: model,
        );

  static SinginPhoneRegistProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SinginPhoneRegistProvider>();
  }

  static SinginPhoneRegistProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<SinginPhoneRegistProvider>()
        ?.widget;
    return widget is SinginPhoneRegistProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant SinginPhoneRegistProvider oldWidget) {
    return true;
  }
}
