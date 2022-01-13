import 'dart:io';

import 'package:ambulance/ui/widgets/colors/my_colors.dart';
import 'package:ambulance/ui/widgets/main_screens/profile/profile_model.dart';
import 'package:ambulance/ui/widgets/main_screens/profile/singin_create_profile/singin_create_profile_model.dart';
import 'package:ambulance/ui/widgets/main_screens/profile/singin_phone/singin_phone_number.dart';
import 'package:ambulance/ui/widgets/main_screens/profile/tab_bar_screens/tab_bar_profile_exemple.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return usersList.isEmpty ? const _RegistWidget() : _Profile();
  }
}

class _Profile extends StatelessWidget {
  final _model = ProfileModel();

  @override
  Widget build(BuildContext context) {
    return ProfileRouter(
      model: _model,
      child: const _ProfileBody(),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _modelForBody = ProfileRouter.watch(context)?.model;
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.white,
        centerTitle: false,
        title: const Text(
          'Мой профиль',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w700, color: MyColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                    backgroundImage:
                        FileImage(File(_modelForBody!.image?.path ?? '')),
                    backgroundColor: MyColors.whiteBlue,
                    radius: 50,
                    child: _modelForBody.image == null
                        ? Text(
                            '${usersList[0].name.split('')[0]}${usersList[0].lastName.split('')[0]}',
                            style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: MyColors.white),
                          )
                        : const Text('')),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () => _modelForBody.getImage(),
                      child: const CircleAvatar(
                        backgroundColor: MyColors.navyBlue,
                        radius: 15,
                        child: Icon(
                          Icons.photo_camera,
                          size: 20,
                          color: MyColors.white,
                        ),
                      ),
                    ))
              ],
            ),
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Scaffold(
                  backgroundColor: MyColors.whiteGrey,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: MyColors.white,
                    title: Column(
                      children: [
                        Text(
                          '${usersList[0].name}  ${usersList[0].lastName}',
                          style: const TextStyle(color: MyColors.black),
                        ),
                        Text('+996${usersList[0].phoneNumber}',
                            style: const TextStyle(
                                color: MyColors.black,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                    bottom: const TabBar(
                      labelStyle:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      indicatorColor: MyColors.navyBlue,
                      labelColor: MyColors.navyBlue,
                      tabs: [
                        Tab(
                          icon: Image(
                              image: AssetImage('assets/images/Vector.png')),
                          text: 'Анализы',
                        ),
                        Tab(
                          icon: Image(
                              image:
                                  AssetImage('assets/images/Vector (1).png')),
                          text: 'Диагнозы',
                        ),
                        Tab(
                          icon: Image(
                              image:
                                  AssetImage('assets/images/Vector (2).png')),
                          text: 'Рекомендации',
                        )
                      ],
                    ),
                  ),
                  body: SizedBox(
                    child: TabBarView(
                      children: [
                        TabBarProfileExemple(
                          listOfpdfAnalises: _modelForBody.listOfpdfAnalises,
                          icon: 'assets/images/page-with-curl_1f4c3 1.png',
                        ),
                        TabBarProfileExemple(
                          listOfpdfAnalises: _modelForBody.listOfpdfDiagnosis,
                          icon: 'assets/images/file-folder_1f4c1 1.png',
                        ),
                        TabBarProfileExemple(
                          listOfpdfAnalises:
                              _modelForBody.listOfpdfRecomendation,
                          icon: 'assets/images/page-with-curl_1f4c3 1.png',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _RegistWidget extends StatelessWidget {
  const _RegistWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
            child: Divider(
              color: MyColors.grey,
              height: 1.0,
            ),
            preferredSize: Size.fromHeight(1.0)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Профиль', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 18),
        child: Column(
          children: [
            const Text('Зачем нужен Профиль?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
            Column(children: _listTilesList),
            const SizedBox(height: 10),
            ElevatedButton(
                style: _buttonStyle,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SinginPhoneRegist()));
                },
                child: const Text(
                  'Войти',
                )),
          ],
        ),
      ),
    );
  }
}

List<Widget> _listTilesList = const [
  ListTile(
    leading: Image(image: AssetImage('assets/images/hospital_1f3e5.png')),
    title: Text(
      'Записывайтесь на прием к самым лучшим специалистам',
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
    ),
  ),
  SizedBox(
    height: 30,
  ),
  ListTile(
    leading: Image(image: AssetImage('assets/images/clipboard_1f4cb.png')),
    title: Text(
      'Сохраняйте результаты ваших анализов, диагнозы и рекомендации от врачей в собственную библиотеку',
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
    ),
  ),
  SizedBox(
    height: 30,
  ),
  ListTile(
    leading:
        Image(image: AssetImage('assets/images/speech-balloon_1f4ac (1).png')),
    title: Text(
      'Просматривайте отзывы о врачах и дополняйте собственными комментариями',
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
    ),
  ),
  SizedBox(
    height: 30,
  ),
  ListTile(
    leading: Image(image: AssetImage('assets/images/bellhop-bell_1f6ce.png')),
    title: Text(
      'Получайте уведомления о приеме или о поступивших сообщениях',
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
    ),
  ),
];

var _buttonStyle = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
    backgroundColor: MaterialStateProperty.all(MyColors.navyBlue),
    padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 120, vertical: 20)));
