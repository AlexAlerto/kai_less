import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kai_less/core/theme.dart';
import 'package:kai_less/data/core/locator_service.dart';
import 'package:kai_less/presentation/screens/main_screen.dart';
import 'package:kai_less/presentation/widgets/general/theme_cubit/theme_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocatorService();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final themeCubit = locator<ThemeCubit>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return BlocBuilder<ThemeCubit, ThemeState>(
      bloc: themeCubit,
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'KaiMobile',
          theme: state.isLightMode ? themeLight : themeDark,
          home: MainScreen(),
        );
      },
    );
  }
}
