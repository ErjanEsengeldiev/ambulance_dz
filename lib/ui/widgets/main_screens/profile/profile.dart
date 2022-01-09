import 'package:ambulance/ui/routes/routes.dart';
import 'package:ambulance/ui/widgets/colors/my_colors.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  Navigator.of(context)
                      .pushNamed(MainNavigationRouteName.singinPhoneRegist);
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
