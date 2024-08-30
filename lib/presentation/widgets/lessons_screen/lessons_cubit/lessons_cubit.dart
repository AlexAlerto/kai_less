import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kai_less/domain/entitys/lesson/lesson_model.dart';
import 'package:kai_less/domain/repositories/mobile_repository.dart';
import 'package:kai_less/domain/repositories/shared_pref_repository.dart';
part 'lessons_state.dart';

class LessonsCubit extends Cubit<LessonsState> {
  final MobileRepository repository;
  final SharedPrefRepository sharedPrefRepository;
  late final StreamSubscription _subscription;

  LessonsCubit(this.sharedPrefRepository, this.repository)
      : super(const LessonsState());

  List<LessonModel> lessons = [];

  void getLessons([String? group]) async {
    final groupNum = group ??
        sharedPrefRepository.getString(kGroupNum);

    emit(LessonsState(lessons: lessons, isLoading: true, groupNum: groupNum));

    if (groupNum != null && groupNum.isNotEmpty) {
      final data = sharedPrefRepository.getString(kLessons);

      if (data != null) {
        lessons = (jsonDecode(data) as List)
            .reversed
            .map(
              (e) => LessonModel.fromJsonByGroupNum(e),
            )
            .toList();
      }

      final response = await repository.getLessons(groupNum);
      if (response.hasData) {
        sharedPrefRepository.setString(kGroupNum, groupNum);
        lessons = response.data!.reversed.toList();
        emit(LessonsState(lessons: lessons, groupNum: groupNum));
      } else {
        emit(
          LessonsState(
            lessons: lessons,
            groupNum: groupNum,
            error: response.error,
          ),
        );
      }
    } else {
      lessons.clear();
      sharedPrefRepository.remove(kLessons);
      emit(LessonsState(isAuthorized: false));
    }
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }
}
