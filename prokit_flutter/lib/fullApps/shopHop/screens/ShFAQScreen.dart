import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShStrings.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShWidget.dart';

class ShFAQScreen extends StatefulWidget {
  static String tag = '/ShFAQScreen';

  @override
  ShFAQScreenState createState() => ShFAQScreenState();
}

class ShFAQScreenState extends State<ShFAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: sh_white,
        title: text(sh_lbl_faq, textColor: sh_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontMedium),
        iconTheme: IconThemeData(color: sh_textColorPrimary),
        actionsIconTheme: IconThemeData(color: sh_colorPrimary),
        actions: <Widget>[cartIcon(context, 3)],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          ExpansionTile(
            title: getTitle(sh_lbl_account_deactivate),
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      getSubTitle(sh_lbl_account_deactivate),
                      getSubTitle(sh_lbl_quick_pay),
                      getSubTitle(sh_lbl_return_items),
                      getSubTitle(sh_lbl_replace_items),
                    ],
                  )),
            ],
          ),
          ExpansionTile(
            title: getTitle(sh_lbl_quick_pay),
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    getSubTitle(sh_lbl_account_deactivate),
                    getSubTitle(sh_lbl_quick_pay),
                    getSubTitle(sh_lbl_return_items),
                    getSubTitle(sh_lbl_replace_items),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: getTitle(sh_lbl_return_items),
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    getSubTitle(sh_lbl_account_deactivate),
                    getSubTitle(sh_lbl_quick_pay),
                    getSubTitle(sh_lbl_return_items),
                    getSubTitle(sh_lbl_replace_items),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: getTitle(sh_lbl_replace_items),
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    getSubTitle(sh_lbl_account_deactivate),
                    getSubTitle(sh_lbl_quick_pay),
                    getSubTitle(sh_lbl_return_items),
                    getSubTitle(sh_lbl_replace_items),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getTitle(String content) {
    return text(content, textColor: sh_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium);
  }

  Widget getSubTitle(String content) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, spacing_standard, 16.0, spacing_standard),
      child: text(content),
    );
  }
}
