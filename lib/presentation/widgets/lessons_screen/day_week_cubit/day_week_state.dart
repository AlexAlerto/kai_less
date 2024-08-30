part of 'day_week_cubit.dart';

class DayWeekState extends Equatable {
  final DayWeekModel dayWeek;

  const DayWeekState(
    this.dayWeek,
  );

  @override
  List<Object?> get props => [dayWeek];
}
