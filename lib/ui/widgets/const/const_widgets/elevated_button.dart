import 'package:ambulance/ui/widgets/const/colors/my_colors.dart';
import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const MyElevatedButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
          backgroundColor: MaterialStateProperty.all(MyColors.navyBlue),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 20))),
      onPressed: onPressed,
      child: Text(
        title,
      ),
    );
  }
}
