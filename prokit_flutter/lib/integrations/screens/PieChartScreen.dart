import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/colors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class PieChartScreen extends StatefulWidget {
  static String tag = '/WaveScreen';

  @override
  PieChartScreenState createState() => PieChartScreenState();
}

class PieChartScreenState extends State<PieChartScreen> {
  int touchedIndex = -1;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardColor,
      appBar: appBar(context, 'Pie Chart'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(40),
              height: 300,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                    setState(() {
                      final desiredTouch = pieTouchResponse.touchInput is! PointerExitEvent && pieTouchResponse.touchInput is! PointerUpEvent;
                      if (desiredTouch && pieTouchResponse.touchedSection != null) {
                        touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                      } else {
                        touchedIndex = -1;
                      }
                    });
                  }),
                  sections: showingSections(),
                  borderData: FlBorderData(show: false),
                  centerSpaceRadius: 60,
                  sectionsSpace: 1,
                ),
              ),
            ),
            Column(
              children: [
                dataPieChart(name: 'Tech', color: darkOrchid),
                16.height,
                dataPieChart(name: 'Food', color: mediumSpringGreen),
                16.height,
                dataPieChart(name: 'Rent', color: crimson),
                16.height,
                dataPieChart(name: 'Travel', color: dodgerBlue),
              ],
            ).paddingOnly(left: 32)
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: dodgerBlue,
            value: 30,
            title: 'Travel',
            radius: radius,
            titleStyle: boldTextStyle(color: white),
          );
        case 1:
          return PieChartSectionData(
            color: crimson,
            value: 20,
            title: 'Rent',
            radius: radius,
            titleStyle: boldTextStyle(color: white),
          );
        case 2:
          return PieChartSectionData(
            color: darkOrchid,
            value: 30,
            title: 'Tech',
            radius: radius,
            titleStyle: boldTextStyle(color: white),
          );
        case 3:
          return PieChartSectionData(
            color: mediumSpringGreen,
            value: 20,
            title: 'Food',
            radius: radius,
            titleStyle: boldTextStyle(color: white),
          );
        default:
          throw Error();
      }
    });
  }

  Widget dataPieChart({required Color color, required String name}) {
    return Row(
      children: [
        Container(height: 25, width: 25, color: color),
        16.width,
        Text(name, style: boldTextStyle(color: white)),
      ],
    );
  }
}
