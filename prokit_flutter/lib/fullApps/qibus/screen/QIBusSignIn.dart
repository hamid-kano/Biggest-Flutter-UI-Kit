import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/codePicker/country_code_picker.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusImages.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';

import 'QIBusVerification.dart';

class QIBusSignIn extends StatefulWidget {
  static String tag = '/QIBusSignIn';

  @override
  QIBusSignInState createState() => QIBusSignInState();
}

class QIBusSignInState extends State<QIBusSignIn> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(qIBus_white);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: qIBus_white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(16, 30, 16, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text(QIBus_text_welcome_to, textColor: qIBus_textChild, fontFamily: fontBold, fontSize: textSizeLarge),
                text(QIBus_text_qibus, textColor: qIBus_colorPrimary, fontFamily: fontBold, fontSize: textSizeXLarge),
                CachedNetworkImage(
                  placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                  imageUrl: qibus_ic_travel,
                  height: width * 0.5,
                  width: width,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                    decoration: boxDecoration(showShadow: false, bgColor: qIBus_white, radius: 8, color: qIBus_colorPrimary),
                    padding: EdgeInsets.all(0),
                    child: Row(
                      children: <Widget>[
                        CountryCodePicker(
                          onChanged: print,
                          padding: EdgeInsets.all(0),
                        ),
                        Container(
                          height: 30.0,
                          width: 1.0,
                          color: qIBus_colorPrimary,
                          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        ),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            style: TextStyle(fontSize: textSizeLargeMedium, fontFamily: fontRegular),
                            decoration: InputDecoration(
                              counterText: "",
                              contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                              hintText: QIBus_hint_mobile,
                              hintStyle: TextStyle(color: qIBus_textChild, fontSize: textSizeMedium),
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 16,
                ),
                QIBusAppButton(
                  textContent: QIBus_lbl_continue,
                  onPressed: () {
                    QIBusVerification().launch(context);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text(QIBus_text_sign_In_with),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: width * 0.4,
                      height: 0.5,
                      color: qIBus_view_color,
                    ),
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          qibus_ic_fb,
                          height: 20,
                          width: 20,
                          color: qIBus_color_facebook,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SvgPicture.asset(
                          qibus_ic_google_fill,
                          color: qIBus_color_google,
                          height: 20,
                          width: 20,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
