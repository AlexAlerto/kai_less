import 'package:equatable/equatable.dart';

class ActivityModel extends Equatable {
  final String id;
  final String title;
  final String desc;
  final String? image;
  final String leader;
  final String date;
  final String address;
  final String links;

  ActivityModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.image,
    required this.leader,
    required this.date,
    required this.address,
    required this.links,
  });

  factory ActivityModel.fromJson(dynamic data) {
    return ActivityModel(
      id: data["_id"].toString().trim(),
      title: data["title"].toString().trim(),
      desc: data["desc"].toString().trim(),
      image: data["image"] != null ? data["image"].toString().trim() : null,
      leader: data["leader"].toString().trim(),
      date: data["schedule"].toString().trim(),
      address: data["address"].toString().trim(),
      links: data["links"].toString().trim(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        desc,
        image,
        leader,
        date,
        address,
        links,
      ];
}
