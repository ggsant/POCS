part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
  List<Object> get props => const <dynamic>[];
}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;

  ThemeChanged({@required this.theme});

  @override
  List<Object> get props => [
        {theme}
      ];
}
