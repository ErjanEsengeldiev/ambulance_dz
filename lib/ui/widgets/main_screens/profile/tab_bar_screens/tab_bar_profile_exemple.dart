import 'package:ambulance/ui/widgets/colors/my_colors.dart';
import 'package:flutter/material.dart';

class TabBarProfileExemple extends StatelessWidget {
  final List<Analisese> listOfpdfAnalises;
  final String icon;
  // final IconData iconData;
  const TabBarProfileExemple({
    Key? key,
    required this.icon,
    required this.listOfpdfAnalises,
    // required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      listOfpdfAnalises.isEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 70),
              child: Column(
                children: [
                  Image(image: AssetImage(icon)),
                  const Text('У вас пока нет добавленных анализов'),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {},
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
                  )
                ],
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: listOfpdfAnalises.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    subtitle: Text(listOfpdfAnalises[index].date),
                    leading: listOfpdfAnalises[index].icon,
                    title: Text(listOfpdfAnalises[index].title),
                  ),
                );
              },
            ),
    ]);
  }
}

class Analisese {
  String title;
  Icon icon;
  String date;
  Analisese({
    required this.date,
    required this.icon,
    required this.title,
  });
}
