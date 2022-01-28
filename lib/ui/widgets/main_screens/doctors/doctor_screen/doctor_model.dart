import 'package:flutter/material.dart';

class DoctorModel extends ChangeNotifier {}

class DoctorModelRouter extends InheritedNotifier {
  final DoctorModel model;

  const DoctorModelRouter(
      {required Widget child, required this.model, Key? key})
      : super(
          key: key,
          child: child,
          notifier: model,
        );

  static DoctorModelRouter? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DoctorModelRouter>();
  }

  static DoctorModelRouter? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<DoctorModelRouter>()
        ?.widget;
    return widget is DoctorModelRouter ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant DoctorModelRouter oldWidget) {
    return true;
  }
}
