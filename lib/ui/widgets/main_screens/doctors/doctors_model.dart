import 'package:flutter/material.dart';

class Doctor {
  Icon image;
  String name;
  String? description;
  String directions;
  double? rating;
  List<String>? comments;
  Doctor({
    this.description,
    this.comments,
    this.rating,
    required this.directions,
    required this.image,
    required this.name,
  });
}

class Directions {
  static String aritmalogiya = 'Артимолог';
  static String cardialogiya = 'Кардиолог';
  static String cardiohirurgiya = 'Кардиохирург';
}

class DoctorsModel extends ChangeNotifier {
  List<Doctor> doctors = [
    Doctor(
      description:
          'Максимально внимательно относится к каждому своему пациенту, старается найти индивидуальный подход, успешно диагностирует и получает хорошие результаты в лечении острых и хронических болезней.  В частности, занимается вопросами нарушения сердечного ритма, врожденными пороками сердца, так называемыми синкопальными состояниями (проще говоря – обмороками). Для подбора эффективного лечения врач оценивает жизненно важные функции, анализирует информацию о принимаемых ребенком лекарствах и перенесенных заболеваниях, назначает необходимые исследования нервной системы.  Возможно получение медицинской помощи без взимания платы при очном обращении в объемах, предусмотренных стандартами обязательного медицинского страхования (ОМС).',
      rating: 5.0,
      directions: Directions.cardialogiya,
      image: const Icon(Icons.picture_as_pdf),
      name: 'Чынгыз Акылбеков',
    ),
    Doctor(
      directions: Directions.aritmalogiya,
      image: const Icon(Icons.picture_as_pdf),
      name: 'Рафаэль Шабутдинов',
    ),
    Doctor(
      directions: Directions.aritmalogiya,
      image: const Icon(Icons.picture_as_pdf),
      name: 'Айбек Сатыбалдиев',
    ),
    Doctor(
      directions: Directions.aritmalogiya,
      image: const Icon(Icons.picture_as_pdf),
      name: 'Рината Сафиуллина',
    ),
    Doctor(
      directions: Directions.aritmalogiya,
      image: const Icon(Icons.picture_as_pdf),
      name: 'Рината Сафиуллина',
    ),
    Doctor(
      directions: Directions.aritmalogiya,
      image: const Icon(Icons.picture_as_pdf),
      name: 'Рината Сафиуллина',
    ),
    Doctor(
      directions: Directions.aritmalogiya,
      image: const Icon(Icons.picture_as_pdf),
      name: 'Рината Сафиуллина',
    ),
    Doctor(
      directions: Directions.aritmalogiya,
      image: const Icon(Icons.picture_as_pdf),
      name: 'Рината Сафиуллина',
    ),
    Doctor(
      directions: Directions.aritmalogiya,
      image: const Icon(Icons.picture_as_pdf),
      name: 'Рината Сафиуллина',
    ),
    Doctor(
      directions: Directions.aritmalogiya,
      image: const Icon(Icons.picture_as_pdf),
      name: 'Рината Сафиуллина',
    ),
  ];
}

class DoctorsModelRouter extends InheritedNotifier {
  final DoctorsModel model;

  const DoctorsModelRouter(
      {required Widget child, required this.model, Key? key})
      : super(
          key: key,
          child: child,
          notifier: model,
        );

  static DoctorsModelRouter? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DoctorsModelRouter>();
  }

  static DoctorsModelRouter? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<DoctorsModelRouter>()
        ?.widget;
    return widget is DoctorsModelRouter ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant DoctorsModelRouter oldWidget) {
    return true;
  }
}
