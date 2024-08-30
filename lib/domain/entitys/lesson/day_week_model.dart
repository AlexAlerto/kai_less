import 'package:equatable/equatable.dart';

class DayWeekModel extends Equatable {
  final int day;
  final int dayWeekNum;
  final int monthNum;
  final bool isEven;
  final String dayWeekName;
  final String monthName;

  DayWeekModel({
    required this.day,
    required this.dayWeekNum,
    required this.monthNum,
    required this.isEven,
    required this.dayWeekName,
    required this.monthName,
  });

  factory DayWeekModel.def({
    required DateTime date,
    required DateTime since,
  }) {
    double dur = (date.difference(since).inDays / 7).ceil() % 2;

    return DayWeekModel(
      day: date.day,
      isEven: dur < 1.0,
      dayWeekNum: date.weekday == 7 ? 5 : date.weekday - 1,
      dayWeekName: date.weekday != 0 ? weekDays[date.weekday - 1] : 'Дн',
      monthNum: date.month,
      monthName: date.month != 0 ? month[date.month - 1] : 'месяц',
    );
  }

  static List<String> weekDays = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];

  static List<String> month = [
    'январь',
    'февраль',
    'март',
    'апрель',
    'май',
    'июнь',
    'июль',
    'август',
    'сентябрь',
    'октябрь',
    'ноябрь',
    'декабрь',
  ];

  @override
  List<Object?> get props => [
        day,
        dayWeekNum,
        isEven,
        dayWeekName,
        monthName,
      ];
}
