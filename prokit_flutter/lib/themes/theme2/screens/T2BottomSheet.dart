import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Colors.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Images.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Strings.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Widgets.dart';

import '../../../main.dart';

class T2BottomSheet extends StatefulWidget {
  static var tag = "/T2BottomSheet";

  @override
  T2BottomSheetState createState() => T2BottomSheetState();
}

class T2BottomSheetState extends State<T2BottomSheet> {
  GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    scaffoldKey = GlobalKey<ScaffoldState>();
    Future.delayed(Duration(milliseconds: 1000), () {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 22),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 25, 20, 20),
                    color: t2_bg_bottom_sheet,
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(t2_lbl_share_to, style: boldTextStyle(color: t2TextColorPrimary)),
                        SizedBox(height: 20),
                        /**/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.keyboard_arrow_left, size: 24),
                            Container(
                              width: MediaQuery.of(context).size.width - 90,
                              height: 50,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    shareIcon(t2_whatsup, t2_green),
                                    shareIcon(t2_facebook, t2_blue),
                                    shareIcon(t2_instagram, t2_instagram_pink),
                                    shareIcon(t2_linkedin, t2_linkedin_pink),
                                    shareIcon(t2_whatsup, t2_green),
                                  ],
                                ),
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_right, size: 24),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Container(
                    width: 45,
                    height: 45,
                    child: FloatingActionButton(
                      onPressed: () {
                        finish(context);
                      },
                      child: Icon(Icons.close, color: t2_colorPrimary),
                      backgroundColor: t2_white,
                    ),
                  ),
                )
              ],
            );
          });
    });
    return Scaffold(
      appBar: appBar(context, t2_Bottom_Sheet),
      body: Observer(
        builder: (_) => Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Center(child: ring(t2_lbl_welcome_to_bottom_n_sheet)),
          ],
        ),
      ),
    );
  }
}
