// ignore_for_file: prefer_const_constructors

import 'package:booknight/full_screen.dart';
import 'package:booknight/list_color.dart';
import 'package:booknight/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screen_wake/flutter_screen_wake.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:torch_light/torch_light.dart';

import 'light_theme_constant.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends ConsumerState<HomeScreen> {
  double brightness = 0.0;
  bool flash = false;

  @override
  void initState() {
    flash == false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomThemes themeData = Theme.of(context).extension<CustomThemes>()!;
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      appBar: AppBar(
        leading: Builder(
            builder: (context) =>
                IconButton(onPressed: () => Scaffold.of(context).openDrawer(), icon: Icon(Icons.menu_rounded))),
        title: Text("Booklight",
            style: TextStyle(fontFamily: 'nunito', color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
        backgroundColor: themeData.appBarColor,
        actions: [
          GestureDetector(
            onTap: () {
              flash = !flash;
              setState(() {
                flash == true ? _turnOnFlash(context) : _turnOffFlash(context);
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 24),
              child: flash == true
                  ? SvgPicture.asset(
                      "assets/icons/ic_flash_on.svg",
                      width: 30,
                      height: 30,
                    )
                  : SvgPicture.asset(
                      "assets/icons/ic_flash_off.svg",
                      width: 30,
                      height: 30,
                    ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 9),
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 16, top: 44),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.25),
              ),
              child: Text('Booklight',
                  style:
                      TextStyle(fontFamily: 'nunito', color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700)),
            ),
            Container(
              padding: EdgeInsets.only(left: 22, top: 13),
              child: Column(
                children: [
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/ic_color_theme.svg", width: 25),
                        SizedBox(width: 13),
                        Text('Color themes',
                            style: TextStyle(
                                fontFamily: 'nunito', color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListColor(),
                          ));
                    },
                  ),
                  SizedBox(height: 25),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/ic_note_navigator.svg", width: 25),
                        SizedBox(width: 13),
                        Text('Notes',
                            style: TextStyle(
                                fontFamily: 'nunito', color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 25),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/ic_set_timer.svg", width: 25),
                        SizedBox(width: 13),
                        Text('Set timer',
                            style: TextStyle(
                                fontFamily: 'nunito', color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SetTimer(),
                          ));
                    },
                  ),
                  SizedBox(height: 25),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/ic_about.svg", width: 25),
                        SizedBox(width: 13),
                        Text('About us',
                            style: TextStyle(
                                fontFamily: 'nunito', color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 25),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/ic_privacy.svg", width: 25),
                        SizedBox(width: 13),
                        Text('Privacy policy',
                            style: TextStyle(
                                fontFamily: 'nunito', color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 25),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/ic_feedback.svg", width: 25),
                        SizedBox(width: 13),
                        Text('Send feedback',
                            style: TextStyle(
                                fontFamily: 'nunito', color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 25),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/ic_rate.svg", width: 25),
                        SizedBox(width: 13),
                        Text('Rate us ',
                            style: TextStyle(
                                fontFamily: 'nunito', color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Column(
                    children: [
                      GestureDetector(onTap: () {}, child: SvgPicture.asset("assets/icons/ic_add_note.svg")),
                      SizedBox(height: 24),
                      SvgPicture.asset("assets/icons/ic_bookMark.svg"),
                      Text("Bookmark",
                          style: TextStyle(
                              fontFamily: 'nunito',
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 12,
                              fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset("assets/icons/ic_light_item.svg"),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SetTimer()));
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset("assets/icons/ic_timer.svg"),
                            Text("Timer",
                                style: TextStyle(
                                    fontFamily: 'nunito',
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      SizedBox(width: 24),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FullScreen(),
                              ));
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset("assets/icons/ic_full_screen.svg"),
                            Text("Full",
                                style: TextStyle(
                                    fontFamily: 'nunito',
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/ic_light_on.svg"),
                    Expanded(
                      child: Slider(
                        inactiveColor: Colors.black,
                        activeColor: Colors.black,
                        thumbColor: Colors.black,
                        label: brightness.round().toString(),
                        value: brightness,
                        onChanged: (value) {
                          setState(() {
                            brightness = value;
                          });
                          FlutterScreenWake.setBrightness(brightness);
                        },
                      ),
                    ),
                    SvgPicture.asset("assets/icons/ic_light_off.svg"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _turnOnFlash(BuildContext context) async {
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {}
  }

  Future<void> _turnOffFlash(BuildContext context) async {
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {}
  }
}
