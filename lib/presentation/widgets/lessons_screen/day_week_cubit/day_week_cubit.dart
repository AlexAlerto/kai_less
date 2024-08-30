import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kai_less/domain/entitys/lesson/day_week_model.dart';

part 'day_week_state.dart';

class DayWeekCubit extends Cubit<DayWeekState> {
  DayWeekCubit()
      : super(
          DayWeekState(
            DayWeekModel.def(
              date: DateTime.now(),
              since: since,
            ),
          ),
        );

  static DateTime since = DateTime(2021, 8, 29);

  void updateDay() {
    final now = DateTime.now();

    emit(
      DayWeekState(
        DayWeekModel.def(
          date: now,
          since: since,
        ),
      ),
    );
  }
}
