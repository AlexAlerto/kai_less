import 'package:get_it/get_it.dart';
import 'package:kai_less/presentation/widgets/lessons_screen/day_week_cubit/day_week_cubit.dart';
import 'package:kai_less/presentation/widgets/lessons_screen/lessons_cubit/lessons_cubit.dart';

Future<void> initLessonsLocatorService(GetIt locator) async {
  locator.registerSingleton<DayWeekCubit>(DayWeekCubit()..updateDay());
  locator.registerSingleton<LessonsCubit>(
    LessonsCubit(locator(), locator())..getLessons(),
  );
}
