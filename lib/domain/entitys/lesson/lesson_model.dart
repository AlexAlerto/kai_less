import 'package:equatable/equatable.dart';

class LessonModel extends Equatable {
  final int dayNum;
  final String dayTime;
  final bool? dayEven;
  final String? dayDate;
  final String disciplineName;
  final String disciplineType;
  final String audNum;
  final String buildNum;
  final String prepodName;
  final String orgName;

  LessonModel({
    required this.dayNum,
    required this.dayTime,
    required this.dayEven,
    required this.dayDate,
    required this.disciplineName,
    required this.disciplineType,
    required this.audNum,
    required this.buildNum,
    required this.prepodName,
    required this.orgName,
  });

  factory LessonModel.fromJson(dynamic data) {
    return LessonModel(
      dayNum: int.parse(data["DayNum"].toString().trim()),
      dayTime: data["DayTime"].toString().trim(),
      dayEven: setWeek(data["DayDate"].toString().trim()),
      disciplineName: data["DisciplineName"].toString().trim(),
      disciplineType: setDisciplineType(
        data["DisciplineType"].toString().trim(),
      ),
      audNum: data["AudNum"].toString().trim(),
      buildNum: data["BuildNum"].toString().trim(),
      prepodName: data["PrepodName"].toString().trim(),
      orgName: data["OrgName"].toString().trim(),
      dayDate: data["DayDate"].toString().trim(),
    );
  }

  factory LessonModel.fromJsonByGroupNum(dynamic data) {
    return LessonModel(
      dayNum: int.parse(data["dayNum"].toString().trim()),
      dayTime: data['dayTime'].trim(),
      dayEven: setWeek(data["dayDate"].toString().trim()),
      dayDate: data['dayDate'].toString().trim(),
      disciplineName: data['disciplName'].toString().trim(),
      disciplineType: setDisciplineType(
        data['disciplType'].toString().trim(),
      ),
      audNum: data['audNum'].toString().trim(),
      buildNum: data['buildNum'].toString().trim(),
      prepodName: data['prepodName'].toString().trim(),
      orgName: data['orgUnitName'].toString().trim(),
    );
  }

  static bool? setWeek(String week) {
    if (week.toLowerCase().contains('чет') &&
        !week.toLowerCase().contains('неч')) {
      return true;
    } else if (week.toLowerCase().contains('неч')) {
      return false;
    } else {
      return null;
    }
  }

  static String setDisciplineType(String disciplineType) {
    if (disciplineType == "лек") {
      return "Лекция";
    } else if (disciplineType == "л.р.") {
      return "Лабораторная работа";
    } else if (disciplineType == "пр") {
      return "Практика";
    } else {
      return disciplineType;
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dayDate'] = dayDate;
    map['audNum'] = audNum;
    map['disciplName'] = disciplineName;
    map['buildNum'] = buildNum;
    map['orgUnitName'] = orgName;
    map['dayTime'] = dayTime;
    map['dayNum'] = dayNum;
    map['prepodName'] = prepodName;
    map['disciplType'] = disciplineName;
    return map;
  }

  @override
  List<Object?> get props => [
        dayNum,
        dayTime,
        dayEven,
        dayDate,
        disciplineName,
        disciplineType,
        audNum,
        buildNum,
        prepodName,
        orgName,
      ];
}
