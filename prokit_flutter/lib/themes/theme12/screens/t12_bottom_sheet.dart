import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_colors.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_constant.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_images.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_widget.dart';

import '../../../main.dart';

class T12BottomSheet extends StatefulWidget {
  static String tag = '/T12BottomSheet';

  @override
  T12BottomSheetState createState() => T12BottomSheetState();
}

class T12BottomSheetState extends State<T12BottomSheet> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      appBar: appBar(context, "Electricity Bill"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(spacing_standard_new),
              decoration: boxDecoration(showShadow: true, bgColor: appStore.scaffoldBackground),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: boxDecoration(showShadow: true, bgColor: Color(0xffBBd2fc), radius: spacing_standard),
                    child: Image.asset(t12_bill, width: 24, height: 24).paddingAll(spacing_standard_new),
                  ),
                  toolBarTitle("\$122.50", textColor: appStore.textPrimaryColor).paddingTop(spacing_standard_new),
                  text("Desko Electricity", textColor: appStore.textPrimaryColor, fontFamily: fontMedium).paddingTop(spacing_standard),
                  text("Last Payment Date: 24 May 2020", textColor: appStore.textSecondaryColor, fontSize: textSizeMedium).paddingTop(spacing_control_half),
                ],
              ).paddingAll(spacing_standard_new),
            ),
            Container(
              width: double.infinity,
              decoration: boxDecoration(bgColor: appStore.scaffoldBackground, showShadow: true, radius: spacing_standard),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text("Subscriber ID", textColor: appStore.textPrimaryColor),
                  formField(context, "Your Subcriber Id", prefixIcon: Icons.person_outline).paddingTop(spacing_standard),
                  text("Bill No", textColor: appStore.textPrimaryColor).paddingTop(spacing_standard),
                  formField(context, "Enter the bill number", prefixIcon: Icons.device_unknown).paddingTop(spacing_standard),
                  text("Amount", textColor: appStore.textPrimaryColor).paddingTop(spacing_standard),
                  formField(context, "Enter the amount", prefixIcon: Icons.attach_money).paddingTop(spacing_standard),
                  SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      padding: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
                      child: text("Pay Now", textColor: Colors.white, fontFamily: fontMedium),
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(spacing_standard)),
                      color: t12_primary_color,
                      onPressed: () => {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: appStore.scaffoldBackground, borderRadius: BorderRadius.only(topLeft: Radius.circular(spacing_standard), topRight: Radius.circular(spacing_standard))),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      decoration: boxDecoration(showShadow: true, bgColor: Color(0xffBBd2fc).withOpacity(0.3), radius: spacing_standard),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            decoration: boxDecoration(showShadow: true, bgColor: Color(0xffBBd2fc), radius: spacing_standard),
                                            child: Image.asset(t12_bill, width: 24, height: 24).paddingAll(spacing_standard_new),
                                          ).paddingRight(spacing_standard_new),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                text("Paying"),
                                                text("Electricity Bill", fontSize: textSizeMedium, textColor: t12_text_color_primary, fontFamily: fontMedium).paddingTop(spacing_control_half),
                                              ],
                                            ),
                                          ),
                                          toolBarTitle("\$122.50").paddingTop(spacing_standard_new),
                                        ],
                                      ).paddingAll(spacing_standard),
                                    ).paddingBottom(spacing_standard_new),
                                    Container(
                                      width: double.infinity,
                                      decoration: boxDecoration(bgColor: appStore.scaffoldBackground, showShadow: true, radius: spacing_standard),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          text("Subscriber ID", textColor: appStore.textPrimaryColor),
                                          formField(context, "Your Subcriber Id", prefixIcon: Icons.person_outline).paddingTop(spacing_standard),
                                          text("Bill No", textColor: appStore.textPrimaryColor).paddingTop(spacing_standard),
                                          formField(context, "Enter the bill number", prefixIcon: Icons.device_unknown).paddingTop(spacing_standard),
                                          text("Amount", textColor: appStore.textPrimaryColor).paddingTop(spacing_standard),
                                          formField(context, "Enter the amount", prefixIcon: Icons.attach_money).paddingTop(spacing_standard),
                                          SizedBox(
                                            width: double.infinity,
                                            child: MaterialButton(
                                              padding: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
                                              child: text("Pay Now", textColor: Colors.white, fontFamily: fontMedium),
                                              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(spacing_standard)),
                                              color: t12_primary_color,
                                              onPressed: () => {
                                                showModalBottomSheet(
                                                    backgroundColor: Colors.transparent,
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(spacing_standard), topRight: Radius.circular(spacing_standard))),
                                                        child: Column(
                                                          children: <Widget>[
                                                            Container(
                                                              width: double.infinity,
                                                              margin: EdgeInsets.all(spacing_standard_new),
                                                              decoration: boxDecoration(showShadow: true, bgColor: Color(0xfff1f4fb)),
                                                              child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  Container(
                                                                    decoration: boxDecoration(showShadow: true, bgColor: Color(0xffBBd2fc), radius: spacing_standard),
                                                                    child: Image.asset(
                                                                      t12_bill,
                                                                      width: 24,
                                                                      height: 24,
                                                                    ).paddingAll(spacing_standard_new),
                                                                  ),
                                                                  Expanded(
                                                                    child: Column(
                                                                      children: <Widget>[
                                                                        text("Paying"),
                                                                        text("Electricity Bill", fontSize: textSizeMedium, textColor: t12_text_color_primary, fontFamily: fontMedium)
                                                                            .paddingTop(spacing_control_half),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  toolBarTitle("\$122.50").paddingTop(spacing_standard_new),
                                                                ],
                                                              ).paddingAll(spacing_standard_new),
                                                            ),
                                                          ],
                                                        ).paddingAll(spacing_standard_new),
                                                      );
                                                    })
                                              },
                                            ),
                                          ).paddingTop(spacing_standard_new)
                                        ],
                                      ).paddingAll(spacing_standard_new),
                                    )
                                  ],
                                ).paddingAll(spacing_standard_new),
                              );
                            })
                      },
                    ),
                  ).paddingTop(spacing_standard_new)
                ],
              ).paddingAll(spacing_standard_new),
            ).paddingAll(spacing_standard_new)
          ],
        ),
      ),
    );
  }
}
