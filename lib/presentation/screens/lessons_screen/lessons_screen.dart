import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:kai_less/data/core/locator_service.dart';
import 'package:kai_less/domain/entitys/lesson/day_week_model.dart';
import 'package:kai_less/presentation/widgets/general/error_alert.dart';
import 'package:kai_less/presentation/widgets/general/loader_widget.dart';
import 'package:kai_less/presentation/widgets/lessons_screen/day_week_cubit/day_week_cubit.dart';
import 'package:kai_less/presentation/widgets/lessons_screen/lessons_cubit/lessons_cubit.dart';
import 'package:kai_less/presentation/widgets/lessons_screen/ui/group_text_field_widget.dart';
import 'package:kai_less/presentation/widgets/lessons_screen/ui/lessons_list_widget.dart';
import 'package:kai_less/presentation/widgets/lessons_screen/ui/week_check_widget.dart';

class LessonsScreen extends StatefulWidget {
  @override
  _LessonsScreenState createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen>
    with SingleTickerProviderStateMixin {
  final date = locator<DayWeekCubit>();
  final lessonsCubit = locator<LessonsCubit>();

  late final ValueNotifier<bool> weekController;
  late final ValueNotifier<bool> editController;
  late final TabController tabController;

  final KeyboardVisibilityController keyboardVisibilityController =
      KeyboardVisibilityController();
  late final StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    subscription = keyboardVisibilityController.onChange.listen((visibility) {
      if (!visibility) {
        editController.value = false;
      }
    });
    weekController = ValueNotifier(date.state.dayWeek.isEven);
    editController = ValueNotifier(false);
    tabController = TabController(
      initialIndex: date.state.dayWeek.dayWeekNum,
      length: 6,
      vsync: this,
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    weekController.dispose();
    editController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: BlocBuilder<LessonsCubit, LessonsState>(
            bloc: lessonsCubit,
            builder: (context, state) {
              return GroupTextFieldWidget(
                editController: editController,
                groupNum: state.groupNum,
                onApplied: (group) {
                  lessonsCubit.getLessons(group);
                  editController.value = false;
                },
              );
            },
          ),
          centerTitle: false,
          actions: [
            WeekCheckWidget(controller: weekController),
          ],
        ),
        body: SafeArea(
          child: BlocListener<DayWeekCubit, DayWeekState>(
            bloc: date,
            listener: (context, state) {
              weekController.value = state.dayWeek.isEven;
              tabController.index = state.dayWeek.dayWeekNum;
              print(state.dayWeek);
            },
            child: Column(
              children: [
                Container(
                  color: Theme.of(context).primaryColor,
                  child: TabBar(
                    controller: tabController,
                    tabs: List.generate(
                      6,
                      (index) => Tab(text: DayWeekModel.weekDays[index]),
                    ),
                  ),
                ),
                Expanded(
                  child: BlocConsumer<LessonsCubit, LessonsState>(
                    bloc: lessonsCubit,
                    listener: (context, state) {
                      if (state.error != null) {
                        showErrorAlertDialog(context, state.error!);
                      }
                    },
                    builder: (context, state) {
                      if (state.isLoading) {
                        return LoadingWidget();
                      }
                      if (!state.isAuthorized || state.groupNum == null) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (!state.isAuthorized)
                            if ((!state.isAuthorized && state.groupNum == null))
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('или'.toUpperCase()),
                              ),
                            if (state.groupNum == null)
                              MaterialButton(
                                child: Text(
                                  "Указать группу",
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                color: Color(0xFF3985c0),
                                onPressed: () async {
                                  editController.value = true;
                                },
                              )
                          ],
                        );
                      }
                      if (state.lessons != null && state.lessons!.isNotEmpty) {
                        return TabBarView(
                          controller: tabController,
                          children: List.generate(
                            6,
                            (index) => LessonsListWidget(
                              day: index + 1,
                              weekController: weekController,
                              lessons: state.lessons!,
                            ),
                          ),
                        );
                      } else {
                        return Center(child: Text('Список занятий пуст'));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
