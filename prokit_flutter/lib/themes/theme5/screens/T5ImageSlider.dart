import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme5/model/T5Models.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Constant.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5DataGenerator.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Strings.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Widget.dart';
import 'package:prokit_flutter/themes/theme5/utils/widgets/T5Slider.dart';

import '../../../main.dart';

class T5ImageSlider extends StatefulWidget {
  static var tag = "/T5ImageSlider";

  @override
  T5ImageSliderState createState() => T5ImageSliderState();
}

class T5ImageSliderState extends State<T5ImageSlider> {
  int selectedPos = 1;
  List<T5Slider>? mSliderList;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mSliderList = getSliders();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(
      appStore.appBarColor!,
    );

    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        color: appStore.scaffoldBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBar(),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20, bottom: 30),
              child: text(t5_image_slider, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeXLarge),
            ),
            T5SliderWidget(mSliderList),
          ],
        ),
      ),
    );
  }
}
