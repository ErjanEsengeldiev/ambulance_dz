import 'dart:io';

import 'package:ambulance/ui/widgets/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../profile_model.dart';

class TabBarProfileExemple extends StatelessWidget {
  final int index;
  final List<Analisese> listOfpdfAnalises;
  final String icon;
  // final IconData iconData;
  const TabBarProfileExemple({
    Key? key,
    required this.index,
    required this.icon,
    required this.listOfpdfAnalises,
    // required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listOfpdfAnalises.isEmpty
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 70),
              child: Column(
                children: [
                  Image(image: AssetImage(icon)),
                  const Text('У вас пока нет добавленных анализов'),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      ProfileRouter.read(context)
                          ?.model
                          .addAnalises(context, index);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add_a_photo_outlined,
                            color: MyColors.navyBlue),
                        SizedBox(width: 10),
                        Text('Добавить документ',
                            style: TextStyle(color: MyColors.navyBlue)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      ProfileRouter.read(context)
                          ?.model
                          .addAnalises(context, index);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.add_a_photo_outlined,
                            color: MyColors.navyBlue),
                        SizedBox(width: 10),
                        Text('Добавить документ',
                            style: TextStyle(color: MyColors.navyBlue)),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listOfpdfAnalises.length,
                  itemBuilder: (context, indexForListView) {
                    return Card(
                      child: ListTile(
                        subtitle:
                            Text(listOfpdfAnalises[indexForListView].date),
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              File(listOfpdfAnalises[indexForListView]
                                  .icon
                                  .path),
                                  fit: BoxFit.cover,
                              width:60,
                              height: 60,
                            )),
                        title: Text(listOfpdfAnalises[indexForListView].title),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
  }
}

class Analisese {
  String title;
  XFile icon;
  String date;
  Analisese({
    required this.date,
    required this.icon,
    required this.title,
  });
}
