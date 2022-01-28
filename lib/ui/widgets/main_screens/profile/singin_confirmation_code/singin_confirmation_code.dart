import 'dart:math';
import 'package:ambulance/ui/widgets/const/colors/my_colors.dart';
import 'package:ambulance/ui/widgets/const/const_widgets/elevated_button.dart';
import 'package:ambulance/ui/widgets/const/styles/text_style.dart';
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
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('Введите код из смс', style: MyTextStyles.f22w500),
                SizedBox(height: 120),
                TextFieldForCode(),
                SizedBox(height: 20),
                ReGetCode(),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
          child: Column(
            children: const [
              Spacer(),
              ElevationButtonForRegistCode(),
              SizedBox(height: 20)
            ],
          ),
        ),
      ],
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
    return MyElevatedButton(
        onPressed: () => model?.chekCode(
            context,
            context
                .findAncestorStateOfType<_SinginConfirmationCodeState>()
                ?.widget
                .number),
        title: 'Далее');
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
        style: MyTextStyles.decorUnderlineColorBlue,
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
      style: MyTextStyles.f18w600,
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
        prefixStyle: MyTextStyles.f18w600,
      ),
    );
  }
}
