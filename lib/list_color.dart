// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'drop_down_theme_changer.dart';
import 'light_theme_constant.dart';

class ListColor extends StatefulWidget {
  const ListColor({super.key});

  @override
  State<ListColor> createState() => _ListColorState();
}

class _ListColorState extends State<ListColor> {
  @override
  Widget build(BuildContext context) {
    CustomThemes themeData = Theme.of(context).extension<CustomThemes>()!;
    return Scaffold(
      appBar: AppBar(
          leadingWidth: 30,
          leading: Builder(
              builder: (context) => GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: SvgPicture.asset(
                        "assets/icons/ic_back_btn.svg",
                      ),
                    ),
                  )),
          title: Text("Color themes",
              style: TextStyle(fontFamily: 'nunito', color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
          backgroundColor: themeData.backgroundColor,
          actions: [ThemeChangerWidget()]),
      body: Container(
          // child: ListView.builder(itemBuilder: itemBuilder),
          ),
    );
  }
}
