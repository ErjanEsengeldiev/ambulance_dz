import 'package:ambulance/ui/widgets/colors/my_colors.dart';
import 'package:ambulance/ui/widgets/main_screens/profile/singin_create_profile/singin_create_profile_model.dart';
import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget {
  final numbe;
  const CreateProfile({Key? key,required this.numbe}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final model = CreateProfileModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  [
          Column(
            children: const[
              _TextFiildName(),
              SizedBox(height: 31),
              _TextFildLastName(),
            ],
          ),
           const _ElevationButton()
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
    return ElevatedButton(
      onPressed:()=> model?.createUser(context),
      child: const Text('Далее'),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
          backgroundColor: MaterialStateProperty.all(MyColors.navyBlue),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 120, vertical: 20))),
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
