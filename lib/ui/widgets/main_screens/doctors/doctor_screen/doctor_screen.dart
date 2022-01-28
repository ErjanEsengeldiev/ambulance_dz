import 'package:ambulance/ui/widgets/const/colors/my_colors.dart';
import 'package:ambulance/ui/widgets/const/const_widgets/elevated_button.dart';
import 'package:ambulance/ui/widgets/main_screens/doctors/doctors_model.dart';
import 'package:flutter/material.dart';

class DoctrorScreen extends StatelessWidget {
  final DoctorsModel model;
  final int indexOfDoctror;
  const DoctrorScreen({
    required this.model,
    Key? key,
    required this.indexOfDoctror,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        foregroundColor: MyColors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: const Icon(
                Icons.bookmark_outline,
                size: 30,
                color: MyColors.black,
              ),
            ),
          )
        ],
        elevation: 0.5,
        backgroundColor: MyColors.white,
        title: Text(
          model.doctors[indexOfDoctror].name,
          style: const TextStyle(color: MyColors.black),
        ),
      ),
      body: _DoctorBody(
        indexOfDoctror: indexOfDoctror,
        model: model,
      ),
    );
  }
}

class _DoctorBody extends StatefulWidget {
  final int indexOfDoctror;
  final DoctorsModel model;
  const _DoctorBody({
    required this.indexOfDoctror,
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  State<_DoctorBody> createState() => _DoctorBodyState();
}

class _DoctorBodyState extends State<_DoctorBody>
    with TickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: MyColors.whiteBlue,
            radius: 50,
            child: widget.model.doctors[widget.indexOfDoctror].image == null
                ? null
                : Text(
                    widget.model.doctors[widget.indexOfDoctror].name
                        .split('')[0],
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: MyColors.white),
                  ),
          ),
          Text(
            '${widget.model.doctors[widget.indexOfDoctror].name}  ',
            style: const TextStyle(color: MyColors.black),
          ),
          Text('rating ${widget.model.doctors[widget.indexOfDoctror].rating}',
              style: const TextStyle(
                  color: MyColors.black, fontWeight: FontWeight.w300)),
          TabBar(
            controller: _controller,
            labelStyle:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            indicatorColor: MyColors.navyBlue,
            labelColor: MyColors.navyBlue,
            tabs: const [
              Tab(
                icon: Image(image: AssetImage('assets/images/Vector.png')),
                text: 'О докторе',
              ),
              Tab(
                icon: Image(image: AssetImage('assets/images/Vector (1).png')),
                text: 'Контакты',
              ),
              Tab(
                icon: Image(image: AssetImage('assets/images/Vector (2).png')),
                text: 'Отзывы',
              )
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      children: [
                        Text(
                          widget.model.doctors[widget.indexOfDoctror]
                                  .description ??
                              'Нет описаний!',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18),
                        ),
                        const Divider(height: 30, thickness: 2),
                        MyElevatedButton(
                            title: 'Записаться на прием', onPressed: () {})
                      ],
                    ),
                  ),
                ),
                Center(child: Text('2')),
                Center(child: Text('3')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
