// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:numberpicker/numberpicker.dart';

import 'light_theme_constant.dart';

class SetTimer extends StatefulWidget {
  const SetTimer({super.key});

  @override
  State<SetTimer> createState() => _SetTimerState();
}

class _SetTimerState extends State<SetTimer> {
  int _seconds = 0;
  int _minutes = 0;
  int _hours = 0;

  bool _isRunning = false;

  Timer? _timer;
  void _startTimer() {
    setState(() {
      _isRunning = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          if (_minutes > 0) {
            _minutes--;
            _seconds = 59;
          } else {
            if (_hours > 0) {
              _hours--;
              _minutes = 59;
              _seconds = 59;
            } else {
              _isRunning = false;
              _timer?.cancel();
            }
          }
        }
      });
    });
  }

  void _pauseTimer() {
    setState(() {
      _isRunning = false;
    });
    _timer?.cancel();
  }

  // This function will be called when the user presses the cancel button
  // Cancel the timer
  void _cancelTimer() {
    setState(() {
      _hours = 0;
      _minutes = 0;
      _seconds = 0;
      _isRunning = false;
    });
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    CustomThemes themeData = Theme.of(context).extension<CustomThemes>()!;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30 ,
        leading: Builder(
            builder: (context) => GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    "assets/icons/ic_back_btn.svg",
                    width: 22,
                  ), 
                )),
        title: Text("Set timer",
            style: TextStyle(fontFamily: 'nunito', color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
        backgroundColor: themeData.backgroundColor,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 37),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isRunning
                ? Center(
                    child: Text(
                      '${_hours.toString().padLeft(2, '0')}:${_minutes.toString().padLeft(2, '0')}:${_seconds.toString().padLeft(2, '0')}',
                      style: TextStyle(
                          fontFamily: 'nunito', color: Colors.black, fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Hour",
                          style: TextStyle(
                              fontFamily: 'nunito', color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700)),
                      NumberPicker(
                        itemWidth: 36,
                        axis: Axis.vertical,
                        value: _hours.toInt(),
                        minValue: 0,
                        maxValue: 99,
                        onChanged: (value) {
                          if (!_isRunning) {
                            setState(() {
                              _hours = value.toInt();
                            });
                          }
                        },
                        // divisions: 100,
                      ),
                      Text("Minute",
                          style: TextStyle(
                              fontFamily: 'nunito', color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700)),
                      NumberPicker(
                        itemWidth: 36,
                        value: _minutes.toInt(),
                        minValue: 0,
                        maxValue: 59,
                        onChanged: (value) {
                          if (!_isRunning) {
                            setState(() {
                              _minutes = value.toInt();
                            });
                          }
                        },
                      ),
                      Text("Sec",
                          style: TextStyle(
                              fontFamily: 'nunito', color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700)),
                      NumberPicker(
                        itemWidth: 36,
                        value: _seconds.toInt(),
                        minValue: 0,
                        maxValue: 59,
                        onChanged: (value) {
                          if (!_isRunning) {
                            setState(() {
                              _seconds = value.toInt();
                            });
                          }
                        },
                        // divisions: 59,
                      ),
                    ],
                  ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    if (_isRunning) {
                      _pauseTimer();
                    } else {
                      _startTimer();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 19, vertical: 7),
                    decoration:
                        BoxDecoration(color: Color(0xFF63C1DE), borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: _isRunning
                        ? Text(
                            'Stop',
                            style: TextStyle(
                                fontFamily: 'nunito', color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                          )
                        : Text('Set time',
                            style: TextStyle(
                                fontFamily: 'nunito', color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),
                // The cancel button
              ],
            ),
            SizedBox(height: 23),
            Text(
              "Set timer countdown to close the app.",
              style: TextStyle(
                  fontFamily: 'nunito',
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }
}
