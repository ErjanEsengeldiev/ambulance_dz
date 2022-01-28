import 'package:ambulance/ui/widgets/const/colors/my_colors.dart';
import 'package:flutter/material.dart';

class Article extends StatelessWidget {
  const Article({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteGrey,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: MyColors.whiteGrey,
        elevation: 0,
        title: const Text(
          'Статьи',
          style: TextStyle(
              fontSize: 34, fontWeight: FontWeight.bold, color: MyColors.black),
        ),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => const ListTile(
                trailing: Icon(Icons.picture_as_pdf),
                title: Text('dasfsfasdfs'),
              )),
    );
  }
}
