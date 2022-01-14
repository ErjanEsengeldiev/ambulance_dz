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
          bottom: const PreferredSize(
              child: Divider(
                color: MyColors.grey,
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(4.0)),
          elevation: 0,
          backgroundColor: MyColors.white,
          centerTitle: false,
          title: const Text('Доктора',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: MyColors.black)),
        ),
      ),
    );
  }
}
