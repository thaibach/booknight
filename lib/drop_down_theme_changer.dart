import 'package:booknight/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeChangerWidget extends StatelessWidget {
  const ThemeChangerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      ThemeControllerState themeState = ref.watch(themeProvider);
      return Padding(
        padding: EdgeInsets.only(right: 10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<CurrentTheme>(
            value: themeState.currentTheme,
            items: const <DropdownMenuItem<CurrentTheme>>[
              DropdownMenuItem(
                value: CurrentTheme.white,
                child: Text('White'),
              ),
              DropdownMenuItem(
                value: CurrentTheme.yellow,
                child: Text('yellow'),
              ),
              DropdownMenuItem(
                value: CurrentTheme.amber,
                child: Text('amber'),
              ),
              DropdownMenuItem(
                value: CurrentTheme.orange,
                child: Text('orange'),
              ),
              DropdownMenuItem(
                value: CurrentTheme.red,
                child: Text('Red'),
              ),
              DropdownMenuItem(
                value: CurrentTheme.pink,
                child: Text('pink'),
              ),
              DropdownMenuItem(
                value: CurrentTheme.deep_pink,
                child: Text('deep_pink'),
              ),
              DropdownMenuItem(
                value: CurrentTheme.purple,
                child: Text('purple'),
              ),
              DropdownMenuItem(
                value: CurrentTheme.deep_purple,
                child: Text('deep_purple'),
              ),
              DropdownMenuItem(
                value: CurrentTheme.indigo,
                child: Text('indigo'),
              ),
              DropdownMenuItem(
                value: CurrentTheme.cyan,
                child: Text('cyan'),
              ),
              DropdownMenuItem(
                value: CurrentTheme.blue,
                child: Text('blue'),
              ),
              DropdownMenuItem(
                value: CurrentTheme.emerald,
                child: Text('emerald'),
              ),
              DropdownMenuItem(
                value: CurrentTheme.green,
                child: Text('green'),
              ),
              DropdownMenuItem(
                value: CurrentTheme.light_green,
                child: Text('light_green'),
              ),
              DropdownMenuItem(
                value: CurrentTheme.lime,
                child: Text('lime'),
              ),
              DropdownMenuItem(
                value: CurrentTheme.gray,
                child: Text('gray '),
              ),
            ],
            onChanged: (CurrentTheme? value) {
              if (value != null) {
                ref.read(themeProvider.notifier).changeTheme(newTheme: value);
              }
            },
          ),
        ),
      );
    });
  }
}
