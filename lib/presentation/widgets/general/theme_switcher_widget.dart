import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:kai_less/data/core/locator_service.dart';
import 'package:kai_less/presentation/widgets/general/theme_cubit/theme_cubit.dart';

class ThemeSwitcherWidget extends StatelessWidget {
  ThemeSwitcherWidget({Key? key}) : super(key: key);
  final themeCubit = locator<ThemeCubit>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 70,
      margin: const EdgeInsets.only(right: 8),
      child: DayNightSwitcher(
        nightBackgroundColor: Colors.black,
        isDarkModeEnabled: !themeCubit.state.isLightMode,
        onStateChanged: (isDarkModeEnabled) {
          themeCubit.changeTheme(!isDarkModeEnabled);
        },
      ),
    );
  }
}
