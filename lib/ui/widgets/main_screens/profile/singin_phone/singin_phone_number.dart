import 'package:ambulance/ui/widgets/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'singin_phone_number_model.dart';

class SinginPhoneRegist extends StatefulWidget {
  const SinginPhoneRegist({Key? key}) : super(key: key);

  @override
  State<SinginPhoneRegist> createState() => _SinginPhoneRegistState();
}

class _SinginPhoneRegistState extends State<SinginPhoneRegist> {
  final _model = SinginPhoneRegistModel();
  @override
  Widget build(BuildContext context) {
    return SinginPhoneRegistProvider(
      model: _model,
      child: const SinginPhoneRegistBody(),
    );
  }
}

class SinginPhoneRegistBody extends StatelessWidget {
  const SinginPhoneRegistBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: MyColors.navyBlue,
        bottom: const PreferredSize(
            child: Divider(
              color: MyColors.grey,
              height: 1.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
        elevation: 0,
        backgroundColor: MyColors.white,
        title: const Text('Вход', style: TextStyle(color: MyColors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: ListView(
          shrinkWrap: true,
          children: const [
            TextFildForNumberRegist(),
            SizedBox(height: 70),
            _ElevationButtonForPhoneRegist()
          ],
        ),
      ),
    );
  }
}

class _ElevationButtonForPhoneRegist extends StatelessWidget {
  const _ElevationButtonForPhoneRegist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = SinginPhoneRegistProvider.read(context)?.model;
    return ElevatedButton(
      onPressed: () => model?.phoneRegist(context),
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

class TextFildForNumberRegist extends StatelessWidget {
  const TextFildForNumberRegist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = SinginPhoneRegistProvider.watch(context)?.model;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Войти',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700)),
      const SizedBox(
        height: 50,
      ),
      const Text('Номер телефона',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
      TextField(
        keyboardType: TextInputType.phone,
        autofocus: true,
        onChanged: (number) {
          model?.refreshTextFild();
          model!.phoneNumber = number;
        },
        decoration: InputDecoration(
          errorText: model?.erorText,
          hintText: '--- --- ---',
          prefix: const Text('+996 '),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      const Text(
        'На указанный вами номер придет однократное СМС-сообщение с кодом подтверждения.',
        style: TextStyle(fontSize: 15),
      ),
    ]);
  }
}
