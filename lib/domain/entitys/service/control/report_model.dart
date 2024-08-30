import 'package:equatable/equatable.dart';

class ReportModel extends Equatable {
  final String id;
  final String status;
  final String message;
  final String? image;
  final String created;

  factory ReportModel.fromJson(dynamic data) {
    return ReportModel(
      id: data["_id"].toString().trim(),
      status: data["status"].toString().trim(),
      message: data["message"].toString().trim(),
      image: data["image"] != null ? data["image"].toString().trim() : null,
      created: data["created"].toString().trim(),
    );
  }

  ReportModel({
    required this.id,
    required this.status,
    required this.message,
    required this.created,
    this.image,
  });

  @override
  List<Object?> get props => [
        id,
        status,
        message,
        created,
        image,
      ];
}
