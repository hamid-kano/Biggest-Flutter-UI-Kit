import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class PERotatedBoxScreen extends StatefulWidget {
  static String tag = '/PERotatedBoxScreen';

  @override
  PERotatedBoxScreenState createState() => PERotatedBoxScreenState();
}

class PERotatedBoxScreenState extends State<PERotatedBoxScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Rotated Box'),
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Text('Without Rotation', style: boldTextStyle()).paddingBottom(20),
            RotatedBox(
              quarterTurns: 4,
              child: CachedNetworkImage(
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                placeholder: (_, s) => placeholderWidget(),
                imageUrl: 'https://cdn.britannica.com/67/19367-050-885866B4/Valley-Taurus-Mountains-Turkey.jpg',
              ).cornerRadiusWithClipRRect(10),
            ).paddingTop(10),
            Text('Rotated at 90° right angle', style: boldTextStyle()).paddingTop(20),
            RotatedBox(
              quarterTurns: 3,
              child: CachedNetworkImage(
                height: 200,
                width: 200,
                fit: BoxFit.cover,
                placeholder: (_, s) => placeholderWidget(),
                imageUrl: 'https://cdn.britannica.com/67/19367-050-885866B4/Valley-Taurus-Mountains-Turkey.jpg',
              ).cornerRadiusWithClipRRect(10),
            ).paddingTop(20),
            Text('Rotated at 180° angle', style: boldTextStyle()).paddingTop(20),
            RotatedBox(
              quarterTurns: 2,
              child: CachedNetworkImage(
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                placeholder: (_, s) => placeholderWidget(),
                imageUrl: 'https://cdn.britannica.com/67/19367-050-885866B4/Valley-Taurus-Mountains-Turkey.jpg',
              ).cornerRadiusWithClipRRect(10),
            ).paddingTop(20),
            Text('Rotated at 90° left  angle', style: boldTextStyle()).paddingTop(20),
            RotatedBox(
              quarterTurns: 1,
              child: CachedNetworkImage(
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                placeholder: (_, s) => placeholderWidget(),
                imageUrl: 'https://cdn.britannica.com/67/19367-050-885866B4/Valley-Taurus-Mountains-Turkey.jpg',
              ).cornerRadiusWithClipRRect(10),
            ).paddingTop(20),
          ],
        ),
      ),
    );
  }
}
