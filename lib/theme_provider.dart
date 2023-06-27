import 'package:booknight/shared_pref.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateNotifierProvider<ThemeController, ThemeControllerState>((ref) {
  return ThemeController();
});

enum CurrentTheme {
  white,
  yellow,
  amber,
  orange,
  red,
  pink,
  deep_pink,
  purple,
  deep_purple,
  indigo,
  cyan,
  blue,
  emerald,
  green,
  light_green,
  lime,
  gray
}

extension CurrentThemeExtensionOnEnum on CurrentTheme {
  String get currentThemeString {
    switch (this) {
      case CurrentTheme.white:
        return 'white';
      case CurrentTheme.yellow:
        return 'yellow';
      case CurrentTheme.amber:
        return 'amber';
      case CurrentTheme.orange:
        return 'orange';
      case CurrentTheme.red:
        return 'red';
      case CurrentTheme.pink:
        return 'pink';
      case CurrentTheme.deep_pink:
        return 'deep_pick';
      case CurrentTheme.purple:
        return 'purple';
      case CurrentTheme.deep_purple:
        return 'deep_purple';
      case CurrentTheme.indigo:
        return 'indigo';
      case CurrentTheme.cyan:
        return 'cyan';
      case CurrentTheme.blue:
        return 'blue';
      case CurrentTheme.emerald:
        return 'emerald';
      case CurrentTheme.green:
        return 'green';
      case CurrentTheme.light_green:
        return 'light_green';
      case CurrentTheme.lime:
        return 'lime';
      case CurrentTheme.gray:
        return 'gray';
    }
  }
}

extension CurrentThemeExtensionOnString on String {
  CurrentTheme? get currentThemeEnum {
    switch (this) {
      case 'white':
        return CurrentTheme.white;
      case 'yellow':
        return CurrentTheme.yellow;
      case 'amber':
        return CurrentTheme.amber;
      case 'orange':
        return CurrentTheme.orange;
      case 'red':
        return CurrentTheme.red;
      case 'pink':
        return CurrentTheme.pink;
      case 'deep_pink':
        return CurrentTheme.deep_pink;
      case 'purple':
        return CurrentTheme.purple;
      case 'deep_purple':
        return CurrentTheme.deep_purple;
      case 'indigo':
        return CurrentTheme.indigo;
      case 'cyan':
        return CurrentTheme.cyan;
      case 'blue': 
        return CurrentTheme.blue;
      case 'emerald':
        return CurrentTheme.emerald;
      case 'green':
        return CurrentTheme.green;
      case 'light_green':
        return CurrentTheme.light_green;
      case 'lime':
        return CurrentTheme.lime;
      case 'gray':
        return CurrentTheme.gray;
    }
  }
}

class ThemeControllerState {
  CurrentTheme currentTheme = CurrentTheme.white;

  ThemeControllerState({
    required this.currentTheme,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ThemeControllerState && runtimeType == other.runtimeType && currentTheme == other.currentTheme);

  ThemeControllerState copyWith({
    CurrentTheme? currentTheme,
  }) {
    return ThemeControllerState(
      currentTheme: currentTheme ?? this.currentTheme,
    );
  }
}

class ThemeController extends StateNotifier<ThemeControllerState> {
  ThemeController() : super(ThemeControllerState(currentTheme: CurrentTheme.white));

  changeTheme({required CurrentTheme newTheme}) {
    state = state.copyWith(currentTheme: newTheme);
    PreferenceManager.setString(SharedPreferencesKey.selectedTheme, newTheme.currentThemeString);
  }

  getInitialTheme(Brightness brightness) {
    String? selectedTheme = PreferenceManager.getString(SharedPreferencesKey.selectedTheme);
    if (selectedTheme is String) {
      state = state.copyWith(currentTheme: selectedTheme.currentThemeEnum ?? CurrentTheme.white);
    } else {
      state = state.copyWith(currentTheme: brightness == Brightness.light ? CurrentTheme.white : CurrentTheme.amber);
    }
  }
}
