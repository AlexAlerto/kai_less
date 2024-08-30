import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kai_less/domain/repositories/shared_pref_repository.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final SharedPrefRepository repository;

  ThemeCubit(this.repository) : super(ThemeState());

  void init() {
    final bool isLightMode = repository.getBool(kUserTheme) ?? true;
    emit(ThemeState(isLightMode: isLightMode));
  }

  void changeTheme(bool isLightMode) {
    repository.setBool(kUserTheme, isLightMode);
    emit(ThemeState(isLightMode: isLightMode));
  }
}
