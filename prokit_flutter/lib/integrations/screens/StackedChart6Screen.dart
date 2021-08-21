import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class StackedChart6Screen extends StatefulWidget {
  @override
  StackedChart6ScreenState createState() => StackedChart6ScreenState();
}

class StackedChart6ScreenState extends State<StackedChart6Screen> {
  List<SalesData> data = [
    SalesData('Jan', 35),
    SalesData('Feb', 28),
    SalesData('Mar', 34),
    SalesData('Apr', 32),
    SalesData('May', 40),
  ];

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
      appBar: appBar(context, 'Half yearly Chart'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              height: 300,
              child: SfCartesianChart(
                zoomPanBehavior: ZoomPanBehavior(
                  enablePinching: true,
                  enableDoubleTapZooming: true,
                  enablePanning: true,
                  enableSelectionZooming: true,
                  enableMouseWheelZooming: true,
                ),
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: 'Half yearly sales analysis'),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<SalesData, String>>[
                  LineSeries<SalesData, String>(
                      dataSource: data,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      name: 'Sales',
                      dataLabelSettings: DataLabelSettings())
                ],
              ),
            ),
            SfSparkLineChart.custom(
              axisLineColor: seaGreen,
              color: redColor,
              trackball: SparkChartTrackball(activationMode: SparkChartActivationMode.tap),
              marker: SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.all),
              labelDisplayMode: SparkChartLabelDisplayMode.all,
              xValueMapper: (int index) => data[index].year,
              yValueMapper: (int index) => data[index].sales,
              dataCount: 5,
            ).paddingAll(16)
          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
