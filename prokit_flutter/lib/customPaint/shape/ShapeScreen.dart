import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/customPaint/shape/CirclePainter.dart';
import 'package:prokit_flutter/customPaint/shape/LinePainter.dart';
import 'package:prokit_flutter/customPaint/shape/RectanglePainter.dart';
import 'package:prokit_flutter/customPaint/shape/RoundedRectanglePainter.dart';
import 'package:prokit_flutter/customPaint/shape/TrianglePainter.dart';
import 'package:prokit_flutter/customPaint/shape/modal/PainterScreenModal.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';

class ShapeScreen extends StatefulWidget {
  @override
  ShapeScreenState createState() => ShapeScreenState();
}

enum PaintType {
  CIRCLE,
  RECTANGLE,
  ROUND_RECTANGLE,
  TRIANGLE,
  LINE,
}

class ShapeScreenState extends State<ShapeScreen> {
  int selectedIndex = 0;
  List<Colors> colors = [];
  bool isCheck = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  CustomPainter buildCustomPainter(PaintType paint, bool isFill) {
    switch (paint) {
      case PaintType.CIRCLE:
        return CirclePainter(ifFill: isFill);
      case PaintType.RECTANGLE:
        return RectanglePainter(isFill: isFill);
      case PaintType.ROUND_RECTANGLE:
        return RoundedRectanglePainter(isFill: isFill);
      case PaintType.TRIANGLE:
        return TrianglePainter(isFill: isFill);
      case PaintType.LINE:
        return LinePainter();
    }
  }

  PaintType? paintType = PaintType.CIRCLE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: appBarWidget('Custom Shape', center: true, color: context.scaffoldBackgroundColor),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 300,
                height: 300,
                child: CustomPaint(
                  painter: buildCustomPainter(paintType!, isCheck),
                ),
              ).center(),
              16.height,
              SettingSection(
                headingDecoration: boxDecorationDefault(
                  color: appStore.isDarkModeOn ? context.cardColor : Color(0xFFECECEC),
                  borderRadius: radius(0),
                ),
                title: Text('Shapes', style: boldTextStyle()),
                items: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(
                      PainterScreenModal.getData().length,
                      (index) {
                        PainterScreenModal data = PainterScreenModal.getData()[index];

                        return AppButton(
                          text: data.shapeName,
                          color: context.cardColor,
                          textColor: selectedIndex == index ? appColorPrimary : textPrimaryColorGlobal,
                          onTap: () {
                            selectedIndex = index;
                            paintType = data.paint!;
                            setState(() {});
                          },
                          padding: EdgeInsets.all(8),
                          shapeBorder: RoundedRectangleBorder(borderRadius: radius(defaultRadius)),
                        );
                      },
                    ),
                  ).paddingAll(16),
                ],
              ),
              Row(
                children: [
                  16.width,
                  Text('Fill', style: boldTextStyle(size: 22)),
                  Checkbox(
                    value: isCheck,
                    fillColor: MaterialStateProperty.all(appColorPrimary),
                    onChanged: (value) {
                      setState(
                        () {
                          isCheck = value!;
                        },
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
