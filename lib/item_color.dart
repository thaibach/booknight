// ignore_for_file: prefer_const_constructors

import 'package:booknight/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemColor extends StatelessWidget {
  ItemColor({
    super.key,
    required this.name,
    required this.color,
    required this.changeColor,
  });
  final String name;
  final Color color;
  final Function changeColor;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      ThemeControllerState themeState = ref.watch(themeProvider);
      return GestureDetector(
        onTap: () {
          // ref.read(themeProvider.notifier).changeTheme(newTheme: CurrentTheme.);
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(6),
          padding: EdgeInsets.symmetric(horizontal: 42, vertical: 19),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: color,
          ),
          child: Text(
            name,
            style: TextStyle(fontFamily: 'nunito', color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      );
    });
  }
}
