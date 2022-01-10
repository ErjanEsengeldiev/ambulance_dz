import 'package:flutter/material.dart';

class MainProfileWidget extends StatelessWidget {
  const MainProfileWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _MainProfileWidgetBody();
  }
}

class _MainProfileWidgetBody extends StatelessWidget {
  const _MainProfileWidgetBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(),
    );
  }
}