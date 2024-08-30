import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kai_less/domain/entitys/lesson/lesson_model.dart';

class LessonItemWidget extends StatelessWidget {
  final LessonModel lesson;

  const LessonItemWidget({Key? key, required this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegExp exp = RegExp(r"[^\w\s]+");
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        height: 110,
        child: Card(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          lesson.dayTime,
                          minFontSize: 24,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 29,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        Text(
                          "Здание: ${lesson.buildNum}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        if (lesson.audNum.replaceAll(exp, '').isNotEmpty)
                          Text(
                            "Ауд: ${lesson.audNum.replaceAll(exp, '')}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, right: 8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: AutoSizeText(
                            "${lesson.disciplineName}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            minFontSize: 8,
                            maxFontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Flexible(
                          flex: 1,
                          child: AutoSizeText(
                            "${lesson.disciplineType}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            minFontSize: 6,
                            maxFontSize: 14,
                          ),
                        ),
                        SizedBox(height: 4),
                        Flexible(
                          flex: 1,
                          child: AutoSizeText(
                            "${lesson.prepodName}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                            minFontSize: 6,
                            maxFontSize: 14,
                          ),
                        ),
                        SizedBox(height: 4),
                        Flexible(
                          flex: 1,
                          child: lesson.dayDate != null
                              ? AutoSizeText(
                                  "${lesson.dayDate}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                                  minFontSize: 6,
                                  maxFontSize: 14,
                                )
                              : SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
