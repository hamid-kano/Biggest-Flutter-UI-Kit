import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/percent_indicator/circular_percent_indicator.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/bezierChart/bezier_chart_config.dart';
import 'package:prokit_flutter/themes/theme14/utils/bezierChart/bezier_chart_widget.dart';
import 'package:prokit_flutter/themes/theme14/utils/bezierChart/bezier_line.dart';

class T14FinanceScreen5 extends StatefulWidget {
  @override
  _T14FinanceScreen5State createState() => _T14FinanceScreen5State();
}

class _T14FinanceScreen5State extends State<T14FinanceScreen5> {
  List<CardTransactionModel> cardTransactionList = getCardTransactionList();
  List<ChoosePlanModel> selectDay = getSelectDayList();
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

  Widget sample5(BuildContext context) {
    final fromDate = DateTime(2020, 5, 22);
    final toDate = DateTime.now();

    final date1 = DateTime.now().subtract(Duration(days: 100));
    final date2 = DateTime.now().subtract(Duration(days: 40));

    final date3 = DateTime.now().subtract(Duration(days: 35));
    final date4 = DateTime.now().subtract(Duration(days: 36));

    final date5 = DateTime.now().subtract(Duration(days: 65));
    final date6 = DateTime.now().subtract(Duration(days: 64));

    return Container(
      decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.all(Radius.circular(20)), backgroundColor: white),
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          BezierChart(
            bezierChartScale: BezierChartScale.MONTHLY,
            fromDate: fromDate,
            toDate: toDate,
            selectedDate: toDate,
            series: [
              BezierLine(
                label: "\$",
                lineStrokeWidth: 4.0,
                lineColor: t14_colorBlue,
                data: [
                  DataPoint<DateTime>(value: 150, xAxis: date1),
                  DataPoint<DateTime>(value: 130, xAxis: date2),
                  DataPoint<DateTime>(value: 50, xAxis: date3),
                  DataPoint<DateTime>(value: 150, xAxis: date4),
                  DataPoint<DateTime>(value: 75, xAxis: date5),
                  DataPoint<DateTime>(value: 152, xAxis: date1),
                ],
              ),
              BezierLine(
                label: "\$",
                lineColor: t14_colorSkyBlue,
                onMissingValue: (dateTime) {
                  if (dateTime!.month.isEven) {
                    return 10.0;
                  }
                  return 5.0;
                },
                data: [
                  DataPoint<DateTime>(value: 120, xAxis: date6),
                  DataPoint<DateTime>(value: 50, xAxis: date2),
                  DataPoint<DateTime>(value: 150, xAxis: date3),
                  DataPoint<DateTime>(value: 80, xAxis: date4),
                  DataPoint<DateTime>(value: 300, xAxis: date5),
                  DataPoint<DateTime>(value: 90, xAxis: date1),
                ],
              ),
            ],
            config: BezierChartConfig(
              verticalIndicatorStrokeWidth: 3.0,
              verticalIndicatorColor: Colors.black26,
              showVerticalIndicator: true,
              verticalIndicatorFixedPosition: false,
              footerHeight: 60.0,
              bubbleIndicatorColor: t14_SignInBgColor2,
              xAxisTextStyle: TextStyle(color: black),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(t14_txt_earning, style: boldTextStyle(color: t14_colorBlue, size: 16)),
                Text(t14_txt_show_all, style: primaryTextStyle(color: gray, size: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: t14_finance5_BgColor,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined, size: 20),
              onPressed: () {
                finish(context);
              }),
          actions: [
            IconButton(icon: Icon(Feather.download, size: 22), onPressed: () {}),
          ],
        ),
        backgroundColor: t14_finance5_BgColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Card transaction', style: boldTextStyle(size: 18, color: t14_colorBlue)),
              16.height,
              Container(
                width: context.width(),
                child: Wrap(
                  alignment: WrapAlignment.spaceAround,
                  spacing: 30.0,
                  runSpacing: 16.0,
                  children: List.generate(selectDay.length, (index) {
                    ChoosePlanModel data = selectDay[index];
                    return Container(
                      padding: EdgeInsets.all(8),
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: i == index ? Colors.transparent : grey.withOpacity(0.3)),
                        backgroundColor: i == index ? white : t14_finance5_BgColor,
                      ),
                      child: Text(
                        i == index ? data.title! : data.title![0],
                        textAlign: TextAlign.center,
                        style: boldTextStyle(color: i == index ? black : t14_colorBlue, size: 14),
                      ),
                    ).onTap(() {
                      i = index;
                      setState(() {});
                    });
                  }),
                ),
              ),
              16.height,
              sample5(context),
              8.height,
              ListView.builder(
                  itemCount: cardTransactionList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  itemBuilder: (context, index) {
                    CardTransactionModel data = cardTransactionList[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          CircularPercentIndicator(
                            radius: 50.0,
                            lineWidth: 2.0,
                            percent: data.percentage,
                            center: Icon(data.icon, size: 20.0, color: Colors.blue),
                            backgroundColor: Colors.grey,
                            progressColor: data.color,
                          ),
                          16.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.transactionType!, style: boldTextStyle(size: 14, color: t14_colorBlue)),
                              4.height,
                              Text(data.totalTransaction!, style: boldTextStyle(size: 12, color: t14_SuccessTxtColor.withOpacity(0.5))),
                            ],
                          ).expand(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(data.rate!, style: boldTextStyle(size: 14, color: t14_colorBlue)),
                              4.height,
                              Text(data.offer!, style: boldTextStyle(size: 12, color: t14_SuccessTxtColor.withOpacity(0.5))),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ],
          ).paddingSymmetric(horizontal: 8),
        ),
      ),
    );
  }
}
