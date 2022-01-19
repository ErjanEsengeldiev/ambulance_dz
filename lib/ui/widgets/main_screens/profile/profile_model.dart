import 'dart:io';
import 'package:ambulance/ui/widgets/colors/my_colors.dart';
import 'package:ambulance/ui/widgets/main_screens/profile/tab_bar_screens/tab_bar_profile_exemple.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileModel extends ChangeNotifier {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  void getImage() async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  void addAnalises(BuildContext context, int index) {
    String name = '';
    XFile? image;
    String date = '12.12.2021';
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: double.infinity,
          color: MyColors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Анализы',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                const SizedBox(height: 20),
                const Text('Названия'),
                TextField(
                  onChanged: (docName) {
                    name = docName;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Введите названия документа'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      switch (index) {
                        case 0:
                          {
                            image = await _picker.pickImage(
                                source: ImageSource.gallery);
                            listOfpdfAnalises.add(Analisese(
                                date: date, icon: image!, title: name));
                            notifyListeners();
                            Navigator.pop(context);
                          }
                          break;
                        case 1:
                          {
                            image = await _picker.pickImage(
                                source: ImageSource.gallery);
                            listOfpdfDiagnosis.add(Analisese(
                                date: date, icon: image!, title: name));
                            notifyListeners();
                            Navigator.pop(context);
                          }
                          break;
                        case 2:
                          {
                            image = await _picker.pickImage(
                                source: ImageSource.gallery);
                            listOfpdfRecomendation.add(Analisese(
                                date: date, icon: image!, title: name));
                            notifyListeners();
                            Navigator.pop(context);
                          }
                          break;
                      }
                    },
                    child: const Text('Добавить документ')),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Analisese> listOfpdfAnalises = [];

  List<Analisese> listOfpdfDiagnosis = [];

  List<Analisese> listOfpdfRecomendation = [];
}

class ProfileRouter extends InheritedNotifier {
  final ProfileModel model;
  // ignore: use_key_in_widget_constructors
  const ProfileRouter({required Widget child, required this.model})
      : super(
          child: child,
          notifier: model,
        );

  static ProfileRouter? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProfileRouter>();
  }

  static ProfileRouter? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ProfileRouter>()
        ?.widget;
    return widget is ProfileRouter ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant ProfileRouter oldWidget) {
    return true;
  }
}
