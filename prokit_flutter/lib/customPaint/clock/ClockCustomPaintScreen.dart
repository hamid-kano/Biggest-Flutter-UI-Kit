import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/customPaint/clock/ClockCustomPainter.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';

class ClockCustomPaintScreen extends StatefulWidget {
  @override
  _ClockCustomPaintScreenState createState() => _ClockCustomPaintScreenState();
}

class _ClockCustomPaintScreenState extends State<ClockCustomPaintScreen> {
  Timer? _timer;

  List<Color> dialColor = [Colors.purple, Colors.red, Colors.blue, Colors.green, Colors.orange];
  List<Color> _hoursAndMinuteLineColor = [Colors.purple, Colors.red, Colors.blue, Colors.green, Colors.orange];
  List<Color> _secondLineColor = [Color(0xFFA33535), Colors.red, Colors.blue, Colors.green, Colors.orange, Colors.purple];

  int selectedIndex = 1;
  int hoursAndMinuteLineIndex = 2;
  int secondLineIndex = 0;

  double dialerValue = 10.0;
  double hours = 4.0;
  double seconds = 4.0;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });

    super.initState();
  }

  Widget dialSettings() {
    return SettingSection(
      headingDecoration: boxDecorationDefault(color: appStore.isDarkModeOn ? context.cardColor : Color(0xFFECECEC), borderRadius: radius(0)),
      title: Text('Case (border)', style: boldTextStyle()),
      items: [
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Colors', style: secondaryTextStyle()),
              16.height,
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(dialColor.length, (index) {
                  bool isSelected = selectedIndex == index;
                  return AnimatedContainer(
                    duration: 1000.milliseconds,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(color: dialColor[index], borderRadius: radius(), boxShadow: defaultBoxShadow()),
                    child: isSelected ? Icon(Icons.done, color: context.iconColor) : Offstage(),
                  ).onTap(() {
                    selectedIndex = index;
                  });
                }),
              ),
              16.height,
              Text('Stroke Width', style: secondaryTextStyle()),
              4.height,
              Row(
                children: [
                  SliderTheme(
                    data: SliderThemeData(
                      thumbColor: dialColor[selectedIndex],
                      activeTrackColor: appColorPrimary,
                      inactiveTrackColor: context.accentColor.withOpacity(0.4),
                    ),
                    child: Slider(
                      value: dialerValue,
                      onChanged: (newValue) {
                        setState(() {
                          dialerValue = newValue;
                        });
                      },
                      max: 40,
                    ),
                  ).expand(),
                  Text('${dialerValue.toInt()}', style: primaryTextStyle()),
                  16.width,
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget hoursAndMinute() {
    return SettingSection(
      headingDecoration: boxDecorationDefault(color: appStore.isDarkModeOn ? context.cardColor : Color(0xFFECECEC), borderRadius: radius(0)),
      title: Text('Hours and minute hand', style: boldTextStyle()),
      items: [
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Colors', style: secondaryTextStyle()),
              16.height,
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(_hoursAndMinuteLineColor.length, (index) {
                  bool isSelected = hoursAndMinuteLineIndex == index;

                  return AnimatedContainer(
                    duration: 1000.milliseconds,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(color: _hoursAndMinuteLineColor[index], borderRadius: radius(), boxShadow: defaultBoxShadow()),
                    child: isSelected ? Icon(Icons.done, color: context.iconColor) : Offstage(),
                  ).onTap(() {
                    hoursAndMinuteLineIndex = index;
                  });
                }),
              ),
              16.height,
              Text('Stroke Width', style: secondaryTextStyle()),
              4.height,
              Row(
                children: [
                  SliderTheme(
                    data: SliderThemeData(
                      thumbColor: _hoursAndMinuteLineColor[hoursAndMinuteLineIndex],
                      activeTrackColor: appColorPrimary,
                      inactiveTrackColor: context.accentColor.withOpacity(0.4),
                    ),
                    child: Slider(
                      value: hours,
                      onChanged: (newValue) {
                        setState(() {
                          hours = newValue;
                        });
                      },
                      max: 10,
                    ),
                  ).expand(),
                  Text('${hours.toInt()}', style: primaryTextStyle()),
                  16.width,
                ],
              ),
              16.height,
            ],
          ),
        ),
      ],
    );
  }

  Widget secondLine() {
    return SettingSection(
      headingDecoration: boxDecorationDefault(
        color: appStore.isDarkModeOn ? context.cardColor : Color(0xFFECECEC),
        borderRadius: radius(0),
      ),
      title: Text('Second hand', style: boldTextStyle()),
      items: [
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Colors', style: secondaryTextStyle()),
              16.height,
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(_secondLineColor.length, (index) {
                  bool isSelected = secondLineIndex == index;

                  return AnimatedContainer(
                    duration: 1000.milliseconds,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(color: _secondLineColor[index], borderRadius: radius(), boxShadow: defaultBoxShadow()),
                    child: isSelected ? Icon(Icons.done, color: context.iconColor) : Offstage(),
                  ).onTap(() {
                    secondLineIndex = index;
                  });
                }),
              ),
              16.height,
              Text('Stroke Width', style: secondaryTextStyle()),
              4.height,
              Row(
                children: [
                  SliderTheme(
                    data: SliderThemeData(
                      thumbColor: _secondLineColor[secondLineIndex],
                      activeTrackColor: appColorPrimary,
                      inactiveTrackColor: context.accentColor.withOpacity(0.4),
                    ),
                    child: Slider(
                      value: seconds,
                      onChanged: (newValue) {
                        setState(() {
                          seconds = newValue;
                        });
                      },
                      max: 10,
                    ),
                  ).expand(),
                  Text('${seconds.toInt()}', style: primaryTextStyle()),
                  16.width,
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget clock() {
    return Transform.rotate(
      angle: -(ClockPainter.oneDegreeInRadian * 90),
      child: CustomPaint(
        willChange: true,
        size: Size.square(180),
        painter: ClockPainter(
          otherPaintersColor: dialColor[selectedIndex],
          strokeWidth: dialerValue,
          hourAndMinutePainterColor: _hoursAndMinuteLineColor[hoursAndMinuteLineIndex],
          hoursAndMinuteLineWidth: hours,
          secondsLine: seconds,
          secondsPointerColor: _secondLineColor[secondLineIndex],
        ),
      ),
    ).center().paddingTop(30);
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.height,
        Text('Customization', style: boldTextStyle(size: 24)).paddingSymmetric(horizontal: 16),
        16.height,
        dialSettings(),
        16.height,
        hoursAndMinute(),
        16.height,
        secondLine(),
        60.height,
      ],
    );
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              floating: true,
              pinned: true,
              elevation: 0.0,
              leading: BackButton(color: context.iconColor),
              flexibleSpace: FlexibleSpaceBar(
                background: clock(),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                body(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
