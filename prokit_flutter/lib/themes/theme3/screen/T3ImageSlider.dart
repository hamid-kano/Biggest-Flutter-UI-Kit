import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme3/model/T3_Model.dart';
import 'package:prokit_flutter/themes/theme3/utils/T3DataGenerator.dart';
import 'package:prokit_flutter/themes/theme3/utils/strings.dart';

import 'T3Dashboard.dart';

class T3ImageSlider extends StatefulWidget {
  static var tag = "/T3ImageSlider";

  @override
  T3ImageSliderState createState() => T3ImageSliderState();
}

class T3ImageSliderState extends State<T3ImageSlider> {
  late List<T3DashboardSliderModel> mSliderListings;

  @override
  void initState() {
    super.initState();
    mSliderListings = getDashboardSlider();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      appBar: appBar(context, t3_slider_title),
      body: Observer(
        builder: (_) => SafeArea(
          child: Container(
            color: appStore.scaffoldBackground,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Container(
                  height: 195,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mSliderListings.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return T3DashboardSlider(mSliderListings[index], index);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
