import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/panel.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/bezierChart/bezier_chart_config.dart';
import 'package:prokit_flutter/themes/theme14/utils/bezierChart/bezier_chart_widget.dart';
import 'package:prokit_flutter/themes/theme14/utils/bezierChart/bezier_line.dart';

class T14FinanceScreen4 extends StatefulWidget {
  @override
  _T14FinanceScreen4State createState() => _T14FinanceScreen4State();
}

class _T14FinanceScreen4State extends State<T14FinanceScreen4> {
  List<ChoosePlanModel> selectDay = getSelectDayList();
  List<MessageListModel> monthViseTransactionList = getMonthViseTransactionList();
  int i = 3;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget _scrollingList(ScrollController sc) {
    return ListView.builder(
        controller: sc,
        itemCount: monthViseTransactionList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          MessageListModel data = monthViseTransactionList[index];
          return Container(
            margin: EdgeInsets.all(8),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.img!, style: boldTextStyle(size: 14, color: t14_colorBlue)),
                    4.height,
                    Text(data.name!, style: boldTextStyle(size: 14, color: t14_SuccessTxtColor.withOpacity(0.5))),
                  ],
                ).expand(),
                Text(data.message!, style: boldTextStyle(size: 14, color: data.isActive! ? t14_txt_trasactionColor : t14_OppsColor2)),
              ],
            ),
          );
        });
  }

  Widget transactionLineChart(BuildContext context) {
    return Container(
      height: 250,
      child: BezierChart(
        bezierChartScale: BezierChartScale.CUSTOM,
        selectedValue: 30,
        xAxisCustomValues: [0, 5, 10, 15, 20, 25, 30, 35],
        series: [
          BezierLine(
            data: [
              DataPoint<double>(value: 10, xAxis: 0),
              DataPoint<double>(value: 130, xAxis: 5),
              DataPoint<double>(value: 40, xAxis: 10),
              DataPoint<double>(value: 150, xAxis: 15),
              DataPoint<double>(value: 75, xAxis: 20),
              DataPoint<double>(value: 0, xAxis: 25),
              DataPoint<double>(value: 5, xAxis: 30),
              DataPoint<double>(value: 150, xAxis: 35),
            ],
          ),
        ],
        config: BezierChartConfig(
          startYAxisFromNonZeroValue: false,
          bubbleIndicatorColor: Colors.white.withOpacity(0.9),
          footerHeight: 40,
          verticalIndicatorStrokeWidth: 3.0,
          verticalIndicatorColor: Colors.black26,
          showVerticalIndicator: true,
          verticalIndicatorFixedPosition: false,
          displayYAxis: true,
          stepsYAxis: 10,
          snap: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: t14_finance4_bgColor,
        body: SlidingUpPanel(
          panelBuilder: (ScrollController? sc) => _scrollingList(sc!),
          minHeight: 350,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios_outlined, size: 20),
                          onPressed: () {
                            finish(context);
                          }),
                      IconButton(icon: Icon(Icons.refresh, size: 20), onPressed: () {}),
                    ],
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: boxDecorationWithShadow(
                      decorationImage: DecorationImage(image: Image.asset(t14_profile1).image, fit: BoxFit.cover),
                      boxShape: BoxShape.circle,
                    ),
                  ),
                  8.height,
                  Text('Dollar', style: boldTextStyle(size: 14, color: white)),
                  8.height,
                  Text('23,161\$', style: boldTextStyle(size: 18, color: white)),
                ],
              ),
              16.height,
              Container(
                width: context.width(),
                child: Wrap(
                  spacing: 30.0,
                  runSpacing: 16.0,
                  alignment: WrapAlignment.spaceAround,
                  children: List.generate(selectDay.length, (index) {
                    ChoosePlanModel data = selectDay[index];

                    return Container(
                      padding: EdgeInsets.all(8),
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: i == index ? Colors.transparent : white.withOpacity(0.5)),
                        backgroundColor: i == index ? t14_finance4_SelectBgColor : t14_finance4_bgColor,
                      ),
                      child: Text(i == index ? data.title! : data.title![0], textAlign: TextAlign.center, style: boldTextStyle(color: i == index ? black : white, size: 14)),
                    ).onTap(() {
                      i = index;
                      setState(() {});
                    });
                  }),
                ).paddingOnly(left: 8),
              ),
              transactionLineChart(context),
            ],
          ).paddingSymmetric(horizontal: 8),
        ),
      ),
    );
  }
}
