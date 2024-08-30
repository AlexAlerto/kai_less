part of 'lessons_cubit.dart';

class LessonsState extends Equatable {
  final List<LessonModel>? lessons;
  final String? error;
  final bool isLoading;
  final bool isAuthorized;
  final String? groupNum;

  const LessonsState({
    this.lessons,
    this.error,
    this.isLoading = false,
    this.isAuthorized = true,
    this.groupNum,
  });

  List<Object?> get props => [
        lessons,
        error,
        isLoading,
        isAuthorized,
        groupNum,
      ];
}
