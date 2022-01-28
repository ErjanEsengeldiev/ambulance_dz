import 'package:ambulance/ui/widgets/const/colors/my_colors.dart';
import 'package:ambulance/ui/widgets/main_screens/doctors/doctor_screen/doctor_screen.dart';
import 'package:flutter/material.dart';

import 'doctors_model.dart';

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    return DoctorsModelRouter(
      model: DoctorsModel(),
      child: const DoctorsBody(),
    );
  }
}

class DoctorsBody extends StatelessWidget {
  const DoctorsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DoctorsModel model = DoctorsModelRouter.watch(context)!.model;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteGrey,
        body: Column(
          children: [
            const AppBarForSortAndSerch(),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: model.doctors.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DoctrorScreen(
                                  model: model,
                                  indexOfDoctror: index,
                                )));
                      },
                      child: ListTile(
                        trailing: SizedBox(
                          width: 70,
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.star_border_outlined),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text('${model.doctors[index].rating ?? 0}')
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.comment_outlined),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      '${model.doctors[index].comments?.length ?? 0}')
                                ],
                              ),
                            ],
                          ),
                        ),
                        tileColor: MyColors.white,
                        subtitle: Text(
                          model.doctors[index].name,
                          style: const TextStyle(
                              fontSize: 17, color: MyColors.black),
                        ),
                        leading: CircleAvatar(
                          radius: 23,
                          child: model.doctors[index].image,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Text(
                            model.doctors[index].directions,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarForSortAndSerch extends StatelessWidget {
  const AppBarForSortAndSerch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Доктора',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: MyColors.black)),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Поиск врача',
                        filled: true,
                        fillColor: MyColors.whiteGrey,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 0),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Очистить',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: MyColors.blackGrey),
                      ),
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: const [
                  InkwellForSort(title: 'Аритмалогия'),
                  InkwellForSort(title: 'Крадиалогия'),
                  InkwellForSort(title: 'Кардиохириргия'),
                  InkwellForSort(title: 'Аритмалогия'),
                  InkwellForSort(title: 'Аритмалогия'),
                  InkwellForSort(title: 'Аритмалогия'),
                ],
              ),
            ),
            Row(
              children: [
                const Icon(Icons.sort_outlined),
                const Text('Сортировка',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text('имя А-Я'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InkwellForSort extends StatelessWidget {
  final String title;
  const InkwellForSort({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: 7,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1, color: MyColors.grey)),
          child: Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
