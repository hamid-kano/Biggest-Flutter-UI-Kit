import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme12/models/T12Models.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_colors.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_constant.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_data_generator.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_widget.dart';

import '../../../main.dart';

class T12TransactionList extends StatefulWidget {
  static String tag = '/T12TransactionList';

  @override
  T12TransactionListState createState() => T12TransactionListState();
}

class T12TransactionListState extends State<T12TransactionList> {
  var selectedTab = 0;
  List<T12Transactions> list = [];

  @override
  void initState() {
    super.initState();
    list.addAll(getAllTransactions());
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var categoryWidth = (width - 56) / 4;

    var allList = ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      padding: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            text(
              list[index].transactionDate,
              fontSize: textSizeMedium,
              textColor: t12_text_secondary,
              fontFamily: fontMedium,
            ).paddingOnly(top: 12, bottom: spacing_standard_new).visible(list[index].transactionDate.toString().isNotEmpty),
            transactionWidget(list[index], categoryWidth),
          ],
        );
      },
    );

    return Scaffold(
      appBar: appBar(context, "Transactions"),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(spacing_standard),
                decoration: boxDecoration(showShadow: true, bgColor: selectedTab == 0 ? t12_primary_color : appStore.scaffoldBackground, radius: spacing_large),
                child: text(
                  "All",
                  textColor: selectedTab == 0 ? Colors.white : t12_text_secondary,
                  fontFamily: fontMedium,
                  fontSize: textSizeMedium,
                ).paddingOnly(top: spacing_standard, bottom: spacing_standard, left: spacing_large, right: spacing_large).onTap(() {
                  setState(() {
                    selectedTab = 0;
                  });
                }, borderRadius: BorderRadius.circular(spacing_large)),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(spacing_standard),
                  alignment: Alignment.center,
                  decoration: boxDecoration(showShadow: true, bgColor: selectedTab == 1 ? t12_primary_color : appStore.scaffoldBackground, radius: spacing_large),
                  child: text(
                    "Received",
                    textColor: selectedTab == 1 ? Colors.white : t12_text_secondary,
                    fontFamily: fontMedium,
                    fontSize: textSizeMedium,
                  ).paddingOnly(top: spacing_standard, bottom: spacing_standard, left: spacing_large, right: spacing_large).onTap(() {
                    setState(() {
                      selectedTab = 1;
                    });
                  }, borderRadius: BorderRadius.circular(spacing_large)),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(spacing_standard),
                  decoration: boxDecoration(showShadow: true, bgColor: selectedTab == 2 ? t12_primary_color : appStore.scaffoldBackground, radius: spacing_large),
                  child: text(
                    "Spend",
                    textColor: selectedTab == 2 ? Colors.white : t12_text_secondary,
                    fontFamily: fontMedium,
                    fontSize: textSizeMedium,
                  ).paddingOnly(top: spacing_standard, bottom: spacing_standard, left: spacing_large, right: spacing_large).onTap(() {
                    setState(() {
                      selectedTab = 2;
                    });
                  }, borderRadius: BorderRadius.circular(spacing_large)),
                ),
              )
            ],
          ).paddingOnly(left: spacing_standard, right: spacing_standard, top: spacing_standard_new),
          Expanded(child: allList)
        ],
      ),
    );
  }
}
