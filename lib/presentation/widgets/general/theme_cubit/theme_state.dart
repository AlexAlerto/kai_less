part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final bool isLightMode;

  ThemeState({this.isLightMode = true});
  @override
  List<Object> get props => [isLightMode];
}
