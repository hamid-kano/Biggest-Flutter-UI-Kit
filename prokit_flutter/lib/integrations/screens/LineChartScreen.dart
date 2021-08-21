import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/colors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LineChartScreen extends StatefulWidget {
  @override
  LineChartScreenState createState() => LineChartScreenState();
}

class LineChartScreenState extends State<LineChartScreen> {
  List<Color> gradientColor = [lineCChart, lineCChart1];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardColor,
      appBar: appBar(context, 'Line Chart'),
      body: Container(
        padding: EdgeInsets.only(right: 16),
        height: 350,
        width: 350,
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: 11,
            minY: 0,
            maxY: 6,
            titlesData: LineTitles.getTitleData(),
            gridData: FlGridData(
                show: true,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: borderText.withOpacity(0.3),
                    strokeWidth: 1,
                  );
                },
                drawVerticalLine: true),
            borderData: FlBorderData(border: Border.all(color: borderText, width: 1)),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 3),
                  FlSpot(2.6, 2),
                  FlSpot(4.9, 5),
                  FlSpot(6.8, 2.5),
                  FlSpot(8, 4),
                  FlSpot(9.5, 3),
                  FlSpot(11, 4),
                ],
                isCurved: true,
                colors: gradientColor,
                barWidth: 5,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                    show: true,
                    colors: gradientColor.map((e) {
                      return e.withOpacity(0.3);
                    }).toList()),
              ),
            ],
          ),
        ),
      ).center(),
    );
  }
}

class LineTitles {
  static getTitleData() => FlTitlesData(
        leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (val) => primaryTextStyle(color: borderText),
            getTitles: (val) {
              switch (val.toInt()) {
                case 2:
                  return '10k';
                case 5:
                  return '30k';
                case 8:
                  return '50k';
              }
              return '';
            },
            reservedSize: 35),
        show: true,
        bottomTitles: SideTitles(
          getTextStyles: (value) => boldTextStyle(color: borderText),
          showTitles: true,
          margin: 8,
          reservedSize: 38,
          getTitles: (val) {
            switch (val.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
        ),
      );
}
