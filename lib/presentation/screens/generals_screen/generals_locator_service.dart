import 'package:get_it/get_it.dart';
import 'package:kai_less/presentation/widgets/general/theme_cubit/theme_cubit.dart';

Future<void> initGeneralsLocatorService(GetIt locator) async {
  locator.registerSingleton<ThemeCubit>(
    ThemeCubit(locator())..init(),
  );
}
