import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/colors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class BarChart2Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChart2ScreenState();
}

class BarChart2ScreenState extends State<BarChart2Screen> {
  static  double barWidth = 22;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff020227),
      appBar: appBar(context, 'Bar Chart 2'),
      body: Container(
        margin: EdgeInsets.only(top: 60),
        height: 450,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.center,
            maxY: 20,
            minY: -20,
            groupsSpace: 12,
            barTouchData: BarTouchData(
              enabled: false,
            ),
            titlesData: FlTitlesData(
              show: true,
              topTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) =>  boldTextStyle(size: 10,color: white),
                margin: 10,
                rotateAngle: 0,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'Mon';
                    case 1:
                      return 'Tue';
                    case 2:
                      return 'Wed';
                    case 3:
                      return 'Thu';
                    case 4:
                      return 'Fri';
                    case 5:
                      return 'Sat';
                    case 6:
                      return 'Sun';
                    default:
                      return '';
                  }
                },
              ),
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) =>  boldTextStyle(color: white,size: 10),
                margin: 10,
                rotateAngle: 0,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'Mon';
                    case 1:
                      return 'Tue';
                    case 2:
                      return 'Wed';
                    case 3:
                      return 'Thu';
                    case 4:
                      return 'Fri';
                    case 5:
                      return 'Sat';
                    case 6:
                      return 'Sun';
                    default:
                      return '';
                  }
                },
              ),
              leftTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) =>  boldTextStyle(color: white,size: 10),
                rotateAngle: 45,
                getTitles: (double value) {
                  if (value == 0) {
                    return '0';
                  }
                  return '${value.toInt()}0k';
                },
                interval: 5,
                margin: 8,
                reservedSize: 30,
              ),
              rightTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) =>  boldTextStyle(color: white,size: 10),
                rotateAngle: 90,
                getTitles: (double value) {
                  if (value == 0) {
                    return '0';
                  }
                  return '${value.toInt()}0k';
                },
                interval: 5,
                margin: 8,
                reservedSize: 30,
              ),
            ),
            gridData: FlGridData(
              show: true,
              checkToShowHorizontalLine: (value) => value % 5 == 0,
              getDrawingHorizontalLine: (value) {
                if (value == 0) {
                  return FlLine(color:  monthChartRight, strokeWidth: 3);
                }
                return FlLine(
                  color: monthChartLeft,
                  strokeWidth: 0.8,
                );
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: [
              BarChartGroupData(
                x: 0,
                barRods: [
                  BarChartRodData(
                    y: 15.1,
                    width: barWidth,
                    borderRadius:  BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, 2,  BarChartColor_One),
                      BarChartRodStackItem(2, 5,  BarChartColor_Two),
                      BarChartRodStackItem(5, 7.5,  BarChartColor_Three),
                      BarChartRodStackItem(7.5, 15.5,  BarChartColor_Four),
                    ],
                  ),
                ],
              ),
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(
                    y: -14,
                    width: barWidth,
                    borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, -1.8, BarChartColor_One),
                      BarChartRodStackItem(-1.8, -4.5, BarChartColor_Two),
                      BarChartRodStackItem(-4.5, -7.5,  BarChartColor_Three),
                      BarChartRodStackItem(-7.5, -14,  BarChartColor_Four),
                    ],
                  ),
                ],
              ),
              BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(
                    y: 13,
                    width: barWidth,
                    borderRadius:  BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, 1.5,  BarChartColor_One),
                      BarChartRodStackItem(1.5, 3.5, BarChartColor_Two),
                      BarChartRodStackItem(3.5, 7,  BarChartColor_Three),
                      BarChartRodStackItem(7, 13, BarChartColor_Four),
                    ],
                  ),
                ],
              ),
              BarChartGroupData(
                x: 3,
                barRods: [
                  BarChartRodData(
                    y: 13.5,
                    width: barWidth,
                    borderRadius:  BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, 1.5,  BarChartColor_One),
                      BarChartRodStackItem(1.5, 3,  BarChartColor_Two),
                      BarChartRodStackItem(3, 7,  BarChartColor_Three),
                      BarChartRodStackItem(7, 13.5, BarChartColor_Four),
                    ],
                  ),
                ],
              ),
              BarChartGroupData(
                x: 4,
                barRods: [
                  BarChartRodData(
                    y: -18,
                    width: barWidth,
                    borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, -2,  BarChartColor_One),
                      BarChartRodStackItem(-2, -4,  BarChartColor_Two),
                      BarChartRodStackItem(-4, -9,  BarChartColor_Three),
                      BarChartRodStackItem(-9, -18,  BarChartColor_Four),
                    ],
                  ),
                ],
              ),
              BarChartGroupData(
                x: 5,
                barRods: [
                  BarChartRodData(
                    y: -17,
                    width: barWidth,
                    borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, -1.2,  BarChartColor_One),
                      BarChartRodStackItem(-1.2, -2.7,  BarChartColor_Two),
                      BarChartRodStackItem(-2.7, -7,  BarChartColor_Three),
                      BarChartRodStackItem(-7, -17, BarChartColor_Four),
                    ],
                  ),
                ],
              ),
              BarChartGroupData(
                x: 6,
                barRods: [
                  BarChartRodData(
                    y: 16,
                    width: barWidth,
                    borderRadius:  BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, 1.2,  BarChartColor_One),
                      BarChartRodStackItem(1.2, 6,  BarChartColor_Two),
                      BarChartRodStackItem(6, 11,  BarChartColor_Three),
                      BarChartRodStackItem(11, 17,  BarChartColor_Four),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
