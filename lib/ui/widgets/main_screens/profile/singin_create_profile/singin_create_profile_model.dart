import 'package:ambulance/ui/widgets/main_screens/profile/main_profile/main_profile_widget.dart';
import 'package:flutter/material.dart';

class CreateProfileModel extends ChangeNotifier {
  var name = '';
  var lastName = '';
  void createUser(BuildContext context) {
    usersList.add(User(
        name: name,
        lastName: lastName,
        phoneNumber: context
            .dependOnInheritedWidgetOfExactType<CreateProfileProviderl>()
            ?.number));

            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const MainProfileWidget()));
  }
}

class CreateProfileProviderl extends InheritedNotifier {
  final number;
  final CreateProfileModel model;
  // ignore: use_key_in_widget_constructors
  const CreateProfileProviderl(
      {required Widget child, required this.model, required this.number})
      : super(
          child: child,
          notifier: model,
        );

  static CreateProfileProviderl? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CreateProfileProviderl>();
  }

  static CreateProfileProviderl? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<CreateProfileProviderl>()
        ?.widget;
    return widget is CreateProfileProviderl ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant CreateProfileProviderl oldWidget) {
    return true;
  }
}

class User {
  String name;
  String lastName;
  String phoneNumber;
  User({
    required this.name,
    required this.lastName,
    required this.phoneNumber,
  });
}

List<User> usersList = [];
