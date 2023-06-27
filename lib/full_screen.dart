// ignore_for_file: prefer_const_constructors

import 'package:booknight/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'light_theme_constant.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CustomThemes themeData = Theme.of(context).extension<CustomThemes>()!;
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      appBar: AppBar(
        leadingWidth: 30,
        leading: Builder(
            builder: (context) => GestureDetector(
                  onTap: () {
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
        title: Text("Full screen",
            style: TextStyle(fontFamily: 'nunito', color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
        backgroundColor: themeData.appBarColor,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SetTimer()));
            },
            child: Container(
                margin: EdgeInsets.only(right: 24), child: SvgPicture.asset("assets/icons/ic_time_white.svg")),
          ),
          GestureDetector(
            onTap: () {},
            child:
                Container(margin: EdgeInsets.only(right: 24), child: SvgPicture.asset("assets/icons/ic_note_btn.svg")),
          )
        ],
      ),
    );
  }
}
