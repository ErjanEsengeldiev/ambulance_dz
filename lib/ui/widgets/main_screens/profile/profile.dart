import 'dart:io';
import 'package:ambulance/ui/widgets/const/colors/my_colors.dart';
import 'package:ambulance/ui/widgets/const/const_widgets/elevated_button.dart';
import 'package:ambulance/ui/widgets/const/styles/text_style.dart';
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

class _ProfileBody extends StatefulWidget {
  const _ProfileBody({
    Key? key,
  }) : super(key: key);

  @override
  State<_ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<_ProfileBody>
    with TickerProviderStateMixin {
  late TabController _controller = TabController(length: 3, vsync: this);
  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

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
                            style: MyTextStyles.f40w500cWhite)
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
            Text(
              '${usersList[0].name}  ${usersList[0].lastName}',
              style: const TextStyle(color: MyColors.black),
            ),
            Text(
              '+996${usersList[0].phoneNumber}',
              style: MyTextStyles.w300cVlack,
            ),
            TabBar(
              controller: _controller,
              labelStyle: MyTextStyles.f12wBold,
              indicatorColor: MyColors.navyBlue,
              labelColor: MyColors.navyBlue,
              tabs: const [
                Tab(
                  icon: Image(image: AssetImage('assets/images/Vector.png')),
                  text: 'Анализы',
                ),
                Tab(
                  icon:
                      Image(image: AssetImage('assets/images/Vector (1).png')),
                  text: 'Диагнозы',
                ),
                Tab(
                  icon:
                      Image(image: AssetImage('assets/images/Vector (2).png')),
                  text: 'Рекомендации',
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  TabBarProfileExemple(
                    modelForBody: _modelForBody,
                    index: 0,
                    listOfpdfAnalises: _modelForBody.listOfpdfAnalises,
                    icon: 'assets/images/page-with-curl_1f4c3 1.png',
                  ),
                  TabBarProfileExemple(
                    modelForBody: _modelForBody,
                    index: 1,
                    listOfpdfAnalises: _modelForBody.listOfpdfDiagnosis,
                    icon: 'assets/images/file-folder_1f4c1 1.png',
                  ),
                  TabBarProfileExemple(
                    modelForBody: _modelForBody,
                    index: 2,
                    listOfpdfAnalises: _modelForBody.listOfpdfRecomendation,
                    icon: 'assets/images/page-with-curl_1f4c3 1.png',
                  ),
                ],
              ),
            ),
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
            const Text('Зачем нужен Профиль?', style: MyTextStyles.f22w500),
            Column(children: _listTilesList),
            const SizedBox(height: 10),
            MyElevatedButton(
              title: 'Войти',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SinginPhoneRegist()));
              },
            ),
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
      style: MyTextStyles.f15w400,
    ),
  ),
  SizedBox(
    height: 30,
  ),
  ListTile(
    leading: Image(image: AssetImage('assets/images/clipboard_1f4cb.png')),
    title: Text(
      'Сохраняйте результаты ваших анализов, диагнозы и рекомендации от врачей в собственную библиотеку',
      style: MyTextStyles.f15w400,
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
      style: MyTextStyles.f15w400,
    ),
  ),
  SizedBox(
    height: 30,
  ),
  ListTile(
    leading: Image(image: AssetImage('assets/images/bellhop-bell_1f6ce.png')),
    title: Text(
      'Получайте уведомления о приеме или о поступивших сообщениях',
      style: MyTextStyles.f15w400,
    ),
  ),
];
