// ignore_for_file: prefer_const_constructors

import 'package:booknight/item_color.dart';
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
            actions: []),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ItemColor(
                name: "White",
                color: Colors.white,
                changeColor: () {},
              ),
              ItemColor(
                name: "Yellow",
                color: Color(0xffFFED50),
                changeColor: () {},
              ),
              ItemColor(
                name: "Amber",
                color: Color(0xffFFCC4A),
                changeColor: () {},
              ),
              ItemColor(
                name: "Orange",
                color: Color(0xffFC7A31),
                changeColor: () {},
              ),
              ItemColor(
                name: "Red",
                color: Color(0xffFF4545),
                changeColor: () {},
              ),
              ItemColor(
                name: "Pink",
                color: Color(0xffF1578F),
                changeColor: () {},
              ),
              ItemColor(
                name: "Deep pink",
                color: Color(0xffD44478),
                changeColor: () {},
              ),
              ItemColor(
                name: "Purple",
                color: Color(0xffCD41FF),
                changeColor: () {},
              ),
              ItemColor(
                name: "Deep purple",
                color: Color(0xff8941FF),
                changeColor: () {},
              ),
              ItemColor(
                name: "Indigo",
                color: Color(0xff8941FF),
                changeColor: () {},
              ),
              ItemColor(
                name: "Cyan",
                color: Color(0xff48DEFF),
                changeColor: () {},
              ),
              ItemColor(
                name: "Blue",
                color: Color(0xff0DB6FF),
                changeColor: () {},
              ),
              ItemColor(
                name: "Emerald",
                color: Color(0xff00B49F),
                changeColor: () {},
              ),
              ItemColor(
                name: "Green",
                color: Color(0xff0BD81F),
                changeColor: () {},
              ),
              ItemColor(
                name: "Light green",
                color: Color(0xff5DFF35),
                changeColor: () {},
              ),
              ItemColor(
                name: "Lime",
                color: Color(0xffB6FF59),
                changeColor: () {},
              ),
              ItemColor(
                name: "Gray",
                color: Color(0xffBEBEBE),
                changeColor: () {},
              ),
            ],
          ),
        ));
  }
}
