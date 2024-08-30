import 'package:equatable/equatable.dart';

class ExamModel extends Equatable {
  final String examDate;
  final String examTime;
  final String disciplineName;
  final String prepodName;
  final String? audNum;
  final String? buildNum;

  ExamModel({
    required this.examDate,
    required this.examTime,
    required this.disciplineName,
    required this.prepodName,
    required this.audNum,
    required this.buildNum,
  });

  factory ExamModel.fromJson(dynamic data) {
    return ExamModel(
      examDate: data["ExamDate"].toString().trim(),
      examTime: data["ExamTime"].toString().trim(),
      disciplineName: data["DisciplineName"].toString().trim(),
      audNum: data["AudNum"].toString().trim(),
      buildNum: data["BuildNum"].toString().trim(),
      prepodName: data["PrepodName"].toString().trim(),
    );
  }

  @override
  List<Object?> get props => [
        examDate,
        examTime,
        disciplineName,
        prepodName,
        audNum,
        buildNum,
      ];
}
