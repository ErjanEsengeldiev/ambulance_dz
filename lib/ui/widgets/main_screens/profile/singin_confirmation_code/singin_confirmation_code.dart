import 'dart:math';
import 'package:ambulance/ui/widgets/colors/my_colors.dart';
import 'package:ambulance/ui/widgets/main_screens/profile/singin_confirmation_code/singin_confirmation_code_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SinginConfirmationCode extends StatefulWidget {
  int codeFromSMS;
  final String number;
  SinginConfirmationCode(
      {Key? key, required this.codeFromSMS, required this.number})
      : super(key: key);

  @override
  State<SinginConfirmationCode> createState() => _SinginConfirmationCodeState();
}

class _SinginConfirmationCodeState extends State<SinginConfirmationCode> {
  final _model = SinginConfirmationCodeModel();

  void _changeCode() {
    setState(() {
      widget.codeFromSMS = Random().nextInt(9999);
    });
  }

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
      body: SinginConfirmationCodeProvider(
          phoneNumber: widget.number,
          codeFromSMS: widget.codeFromSMS,
          model: _model,
          child: const SinginConfirmationCodeBody()),
    );
  }
}

class SinginConfirmationCodeBody extends StatelessWidget {
  const SinginConfirmationCodeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text('Введите код из смс',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
          SizedBox(height: 120),
          TextFieldForCode(),
          SizedBox(height: 20),
          ReGetCode(),
          SizedBox(height: 24),
          ElevationButtonForRegistCode(),
        ],
      ),
    );
  }
}

class ElevationButtonForRegistCode extends StatelessWidget {
  const ElevationButtonForRegistCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = SinginConfirmationCodeProvider.watch(context)?.model;
    return ElevatedButton(
      onPressed: () => model?.chekCode(
          context,
          context
              .findAncestorStateOfType<_SinginConfirmationCodeState>()
              ?.widget
              .number),
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

class ReGetCode extends StatelessWidget {
  const ReGetCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context
          .findAncestorStateOfType<_SinginConfirmationCodeState>()
          ?._changeCode(),
      child: const Text(
        'Получить код повторно',
        style:
            TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
      ),
    );
  }
}

class TextFieldForCode extends StatelessWidget {
  const TextFieldForCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = SinginConfirmationCodeProvider.watch(context)?.model;
    return TextField(
      keyboardType: TextInputType.number,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      obscuringCharacter: '*',
      obscureText: model!.obscureText,
      textAlign: TextAlign.center,
      autofocus: true,
      onChanged: (code) => {
        model.txtFildText = code,
      },
      decoration: InputDecoration(
        helperText:
            'Код из смс ${context.findAncestorStateOfType<_SinginConfirmationCodeState>()?.widget.codeFromSMS}',
        suffixIcon: InkWell(
          onTap: () => model.lookPassword(),
          child: Icon(model.suffixIcon),
        ),
        prefixText: 'Код',
        prefixStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }
}
