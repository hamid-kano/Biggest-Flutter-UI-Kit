import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme5/screens/T5SetFingerPrint.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Colors.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Images.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Strings.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Widget.dart';

import '../../../main.dart';

class T5SetPassword extends StatefulWidget {
  static String tag = '/T5SetPassword';

  @override
  T5SetPasswordState createState() => T5SetPasswordState();
}

class T5SetPasswordState extends State<T5SetPassword> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: height,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CachedNetworkImage(placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?, imageUrl: t5_ragistration, width: width / 2.5, height: width / 2.5),
                  SizedBox(height: 30),
                  text(t5_lbl_set_pawd, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: 22.0),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.all(24),
                    decoration: boxDecoration(bgColor: appStore.scaffoldBackground, showShadow: true, radius: 4),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(height: 10),
                        EditText(hint: t5_hint_password, isSecure: true),
                        SizedBox(height: 16),
                        EditText(hint: t5_hint_confirm_password, isSecure: true),
                        SizedBox(height: 24),
                        GestureDetector(
                          onTap: () {
                            T5SetFingerPrint().launch(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: width / 8,
                            child: text(t5_continue, textColor: t5White, isCentered: true),
                            decoration: boxDecoration(bgColor: t5ColorPrimary, radius: 24),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          TopBar()
        ],
      ),
    );
  }
}
