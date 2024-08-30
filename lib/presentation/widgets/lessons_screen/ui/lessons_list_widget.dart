import 'package:flutter/material.dart';
import 'package:kai_less/domain/entitys/lesson/lesson_model.dart';
import 'package:kai_less/presentation/widgets/lessons_screen/ui/lesson_item.dart';

class LessonsListWidget extends StatelessWidget {
  final int day;
  final ValueNotifier<bool> weekController;
  final List<LessonModel> lessons;

  const LessonsListWidget({
    Key? key,
    required this.day,
    required this.weekController,
    required this.lessons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: weekController,
      builder: (BuildContext context, value, Widget? child) {
        final todayLessons = lessons
            .where(
              (element) =>
                  element.dayNum == day &&
                  (element.dayEven == value || element.dayEven == null),
            )
            .toList()
            .reversed
            .toList();
        if (todayLessons.isEmpty) {
          return Center(child: Text('Нет занятий'));
        }
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              todayLessons.length,
              (index) => LessonItemWidget(lesson: todayLessons[index]),
            ),
          ),
        );
      },
    );
  }
}
