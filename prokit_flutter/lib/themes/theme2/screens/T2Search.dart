import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Colors.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Images.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Strings.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Widgets.dart';

class T2Search extends StatefulWidget {
  static var tag = "/T2Search";

  @override
  T2SearchState createState() => T2SearchState();
}

class T2SearchState extends State<T2Search> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      appBar: appBar(context, t2_lbl_search),
      body: Observer(
        builder: (_) => Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Stack(
                alignment: Alignment.centerRight,
                children: <Widget>[
                  SizedBox(height: 16),
                  TextField(
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: appStore.scaffoldBackground,
                      hintText: t2_lbl_search,
                      hintStyle: primaryTextStyle(),
                      contentPadding: EdgeInsets.only(left: 26.0, bottom: 8.0, top: 8.0, right: 50.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: t2_view_color, width: 0.5),
                        borderRadius: BorderRadius.circular(26),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: t2_view_color, width: 0.5),
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: SvgPicture.asset(t2_search, color: t2_colorPrimary),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height - 200,
                  child: ring(t2_lbl_welcome_to_search_bar),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
