import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/codePicker/country_code_picker.dart';
import 'package:prokit_flutter/themes/theme5/screens/T5Verification.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Colors.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Constant.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Images.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Strings.dart';

import '../../../main.dart';

class T5SignUp extends StatefulWidget {
  static String tag = '/T5SignUp';

  @override
  T5SignUpState createState() => T5SignUpState();
}

class T5SignUpState extends State<T5SignUp> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          alignment: Alignment.center,
          color: appStore.scaffoldBackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CachedNetworkImage(placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?, imageUrl: t5_ragistration, width: width / 2.5, height: width / 2.5),
              text(t5_heading_login, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: 22.0),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 16),
                child: text(t5_note_registration, textColor: t5TextColorSecondary, fontFamily: fontMedium, fontSize: textSizeMedium, maxLine: 2, isCentered: true),
              ),
              Container(
                margin: EdgeInsets.all(24),
                decoration: boxDecoration(bgColor: appStore.scaffoldBackground, showShadow: true, radius: 4.0),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), border: Border.all(color: t5ViewColor, width: 0.5)),
                      child: Row(
                        children: <Widget>[
                          CountryCodePicker(onChanged: print, showFlag: true),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              style: TextStyle(fontSize: textSizeLargeMedium, fontFamily: fontRegular),
                              decoration: InputDecoration(
                                counterText: "",
                                contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                                hintText: t5_hint_phone_no,
                                hintStyle: TextStyle(color: t5TextColorThird),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        T5Verification().launch(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: width / 8,
                        child: text(t5_continue, textColor: t5White, isCentered: true),
                        decoration: boxDecoration(bgColor: t5ColorPrimary, radius: 8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
