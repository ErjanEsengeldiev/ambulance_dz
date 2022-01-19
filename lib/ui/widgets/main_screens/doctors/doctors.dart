import 'package:ambulance/ui/widgets/colors/my_colors.dart';
import 'package:flutter/material.dart';

class Doctors extends StatelessWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            children: [],
          ),
          foregroundColor: MyColors.navyBlue,
          elevation: 0,
          backgroundColor: MyColors.white,
          centerTitle: false,
          title: const Text('Доктора',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: MyColors.black)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
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
            ],
          ),
        ),
      ),
    );
  }
}
