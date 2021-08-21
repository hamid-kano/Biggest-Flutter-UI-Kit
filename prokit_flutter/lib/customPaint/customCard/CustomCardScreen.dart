import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/customPaint/customCard/model/CustomCardScreenModal.dart';

import 'CustomCardCustomPainter.dart';

class CustomCardScreen extends StatefulWidget {
  @override
  CustomCardScreenState createState() => CustomCardScreenState();
}

class CustomCardScreenState extends State<CustomCardScreen> {
  List<CustomScreenModal> imageList = getData();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Custom card', center: true, color: context.scaffoldBackgroundColor),
      body: HorizontalList(
        spacing: 8,
        runSpacing: 8,
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 15, right: 15),
            child: ClipPath(
              clipper: CustomCardCustomPainter(),
              child: SizedBox(
                height: 350,
                width: 240,
                child: Image.asset(
                  imageList[index].img.validate(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ).center();
        },
      ),
    );
  }
}
