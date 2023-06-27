import 'package:booknight/shared_pref.dart';
import 'package:booknight/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_screen.dart';
import 'light_theme_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceManager.init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(themeProvider.notifier).getInitialTheme(WidgetsBinding.instance.window.platformBrightness);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      ThemeControllerState themestate = ref.watch(themeProvider);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeDecider(themestate),
        home: const HomeScreen(),
      );
    });
  }

  themeDecider(ThemeControllerState themestate) {
    switch (themestate.currentTheme) {
      case CurrentTheme.white:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.white,
        ]);
      case CurrentTheme.yellow:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.yellow,
        ]);
      case CurrentTheme.amber:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.amber,
        ]);
      case CurrentTheme.orange:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.orange,
        ]);
      case CurrentTheme.red:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.red,
        ]);
      case CurrentTheme.pink:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.pink,
        ]);
      case CurrentTheme.deep_pink:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.deep_link,
        ]);
      case CurrentTheme.purple:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.purple,
        ]);
      case CurrentTheme.deep_purple:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.deep_purple,
        ]);
      case CurrentTheme.indigo:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.indigo,
        ]);
      case CurrentTheme.cyan:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.cyan,
        ]);
      case CurrentTheme.blue:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.blue,
        ]);
      case CurrentTheme.emerald:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.emerald,
        ]);
      case CurrentTheme.green:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.green,
        ]);
      case CurrentTheme.light_green:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.light_green,
        ]);
      case CurrentTheme.lime:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.lime,
        ]);
      case CurrentTheme.gray:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.gray,
        ]);
    }
  }
}
