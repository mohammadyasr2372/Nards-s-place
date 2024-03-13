part of 'theme_app_bloc.dart';

sealed class ThemeAppEvent extends Equatable {
  const ThemeAppEvent();

  @override
  List<Object> get props => [];
}
 

class SetInitialThemeApp extends ThemeAppEvent{}
class SwitcherThemeApp extends ThemeAppEvent{}