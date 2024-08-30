import 'package:equatable/equatable.dart';

class GroupMateModel extends Equatable {
  final String studentFIO;
  final int? isStarosta;
  final String? studentEmail;
  final String? studentPhone;

  GroupMateModel({
    required this.studentFIO,
    required this.isStarosta,
    required this.studentEmail,
    required this.studentPhone,
  });

  factory GroupMateModel.fromJson(dynamic data) {
    var phone = data["StudentPhone"].toString().trim().replaceAll(" ", "");
    if (phone.isNotEmpty && phone[0] == "8") {
      phone = phone.replaceFirst("8", "+7");
    }
    return GroupMateModel(
      isStarosta: int.parse(data["IsStarosta"].toString().trim()),
      studentFIO: data["StudentFIO"].toString().trim(),
      studentEmail: data["StudentEmail"].toString().trim().toLowerCase(),
      studentPhone: phone,
    );
  }

  @override
  List<Object?> get props => [
        studentFIO,
        isStarosta,
        studentEmail,
        studentPhone,
      ];
}
