import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/shopHop/screens/ShAdressManagerScreen.dart';
import 'package:prokit_flutter/fullApps/shopHop/screens/ShOffersScreen.dart';
import 'package:prokit_flutter/fullApps/shopHop/screens/ShQuickPayCardsScreen.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShImages.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShStrings.dart';

import 'ShOrderListScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class ShAccountScreen extends StatefulWidget {
  static String tag = '/ShAccountScreen';

  @override
  ShAccountScreenState createState() => ShAccountScreenState();
}

class ShAccountScreenState extends State<ShAccountScreen> {
  var firstNameCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      firstNameCont.text = "+919656231245";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: sh_white,
        title: text(sh_lbl_account, textColor: sh_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontMedium),
        iconTheme: IconThemeData(color: sh_textColorPrimary),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: spacing_standard,
              margin: EdgeInsets.all(spacing_control),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(ic_user),
                  radius: 60,
                ),
              ),
            ),
            text("Julie Deerman", textColor: sh_textColorPrimary, fontFamily: fontBold, fontSize: textSizeLarge),
            Container(
              margin: EdgeInsets.all(spacing_standard_new),
              padding: EdgeInsets.all(spacing_middle),
              decoration: BoxDecoration(border: Border.all(color: sh_view_color, width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      text(sh_lbl_please_verify_your_email_or_number, textColor: sh_textColorPrimary, fontSize: textSizeMedium),
                      Expanded(child: Image.asset(sh_radar, width: 30, height: 30))
                    ],
                  ),
                  SizedBox(
                    height: spacing_control_half,
                  ),
                  text(sh_lbl_get_newest_offers, fontSize: textSizeMedium),
                  SizedBox(
                    height: spacing_standard_new,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        controller: firstNameCont,
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(color: sh_textColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                        decoration: InputDecoration(
                            filled: false,
                            contentPadding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.5)),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0))),
                      ),
                      MaterialButton(
                        padding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
                        child: text(sh_lbl_verify_now, fontSize: textSizeMedium, fontFamily: fontMedium, textColor: sh_white),
                        textColor: sh_white,
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
                        color: sh_colorPrimary,
                        onPressed: () => {},
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: spacing_standard_new, bottom: spacing_standard_new, right: spacing_standard_new),
              child: Column(
                children: <Widget>[
                  getRowItem(sh_lbl_address_manager, callback: () {
                    ShAddressManagerScreen().launch(context);
                  }),
                  SizedBox(height: spacing_standard_new),
                  getRowItem(sh_lbl_my_order, callback: () {
                    ShOrderListScreen().launch(context);
                  }),
                  SizedBox(height: spacing_standard_new),
                  getRowItem(sh_lbl_my_offers, callback: () {
                    ShOffersScreen().launch(context);
                  }),
                  SizedBox(height: spacing_standard_new),
                  getRowItem(sh_lbl_wish_list, callback: () {
                    Navigator.of(context).pop(true);
                  }),
                  SizedBox(height: spacing_standard_new),
                  getRowItem(sh_lbl_quick_pay_cards, callback: () {
                    ShQuickPayCardsScreen().launch(context);
                  }),
                  SizedBox(height: spacing_standard_new),
                  getRowItem(sh_lbl_help_center),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    // height: double.infinity,
                    child: MaterialButton(
                      padding: EdgeInsets.all(spacing_standard),
                      child: text("Sign Out", fontSize: textSizeNormal, fontFamily: fontMedium, textColor: sh_colorPrimary),
                      textColor: sh_white,
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0), side: BorderSide(color: sh_colorPrimary, width: 1)),
                      color: sh_white,
                      onPressed: () => {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getRowItem(String title, {VoidCallback? callback}) {
    return InkWell(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: sh_view_color, width: 1)),
        padding: EdgeInsets.fromLTRB(spacing_standard, 0, spacing_control_half, 0),
        child: Row(
          children: <Widget>[
            Expanded(child: text(title, textColor: sh_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontMedium)),
            IconButton(
              icon: Icon(
                Icons.keyboard_arrow_right,
                color: sh_textColorPrimary,
                size: 24,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
