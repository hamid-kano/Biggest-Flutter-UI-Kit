import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme2/models/models.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2DataGenerator.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Slider.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Strings.dart';

import '../../../main.dart';

class T2ImageSlider extends StatefulWidget {
  static var tag = "/T2ImageSlider";

  @override
  T2ImageSliderState createState() => T2ImageSliderState();
}

class T2ImageSliderState extends State<T2ImageSlider> {
  var currentIndexPage = 0;
  List<T2Slider>? mSliderList;

  @override
  void initState() {
    super.initState();
    mSliderList = getSliders();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      appBar: appBar(context, t2_Image_Slider),
      body: Observer(
        builder: (_) => Column(
          children: <Widget>[
            SizedBox(height: 16),
            T2SliderWidget(),
          ],
        ),
      ),
    );
  }
}
