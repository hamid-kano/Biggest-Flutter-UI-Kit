import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme6/models/T6Models.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6DataGenerator.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Widget.dart';
import 'package:prokit_flutter/themes/theme6/utils/Widget/T6SliderWidget.dart';

import '../../../main.dart';

class T6ImageSlider extends StatefulWidget {
  static String tag = '/T6ImageSlider';

  @override
  T6ImageSliderState createState() => T6ImageSliderState();
}

class T6ImageSliderState extends State<T6ImageSlider> {
  int selectedPos = 1;
  List<T6Slider>? mSliderList;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mSliderList = getSliders();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBar(titleName: "Image Slider"),
            SizedBox(height: 16),
            T6SliderWidget(mSliderList),
          ],
        ),
      ),
    );
  }
}
