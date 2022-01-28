import 'package:ambulance/ui/widgets/const/colors/my_colors.dart';
import 'package:ambulance/ui/widgets/const/const_widgets/elevated_button.dart';
import 'package:ambulance/ui/widgets/main_screens/profile/singin_create_profile/singin_create_profile_model.dart';
import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget {
  final numbe;
  const CreateProfile({Key? key, required this.numbe}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final model = CreateProfileModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: MyColors.navyBlue,
        title: const Text(
          'Потверждения кода',
          style: TextStyle(color: MyColors.black),
        ),
        backgroundColor: MyColors.white,
        elevation: 0,
        bottom: const PreferredSize(
            child: Divider(
              color: MyColors.grey,
              height: 1.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      body: CreateProfileProviderl(
        number: widget.numbe,
        child: const CreateProfileBody(),
        model: model,
      ),
    );
  }
}

class CreateProfileBody extends StatelessWidget {
  const CreateProfileBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
      child: Stack(
        children: [
          ListView(
            children: [
              Column(
                children: const [
                  _TextFiildName(),
                  SizedBox(height: 31),
                  _TextFildLastName(),
                  SizedBox(height: 31),
                ],
              ),
            ],
          ),
          Column(
            children: const [
              Spacer(),
              _ElevationButton(),
            ],
          )
        ],
      ),
    );
  }
}

class _ElevationButton extends StatelessWidget {
  const _ElevationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = CreateProfileProviderl.watch(context)?.model;
    return MyElevatedButton(
      onPressed: () => model?.createUser(context),
      title: 'Далее',
    );
  }
}

class _TextFildLastName extends StatelessWidget {
  const _TextFildLastName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = CreateProfileProviderl.watch(context)?.model;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Фамилия'),
        TextField(
          onChanged: (lastName) {
            model?.lastName = lastName;
          },
          decoration: const InputDecoration(hintText: 'Введите вашу фамилию'),
        ),
      ],
    );
  }
}

class _TextFiildName extends StatelessWidget {
  const _TextFiildName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = CreateProfileProviderl.watch(context)?.model;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Имя'),
        TextField(
          onChanged: (name) {
            model?.name = name;
          },
          decoration: const InputDecoration(hintText: 'Введите ваше имя'),
        ),
      ],
    );
  }
}
