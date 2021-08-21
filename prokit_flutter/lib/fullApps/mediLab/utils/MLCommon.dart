import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';

Widget mlBackToPrevious(BuildContext context, Color color) {
  return Align(
    alignment: Alignment.topLeft,
    child: Icon(Icons.arrow_back_ios, color: color),
  ).paddingOnly(top: 24.0, left: 24.0).onTap(() {
    finish(context);
  });
}

Widget mlRoundedIconContainer(IconData iconData, Color color) {
  return Container(
    padding: EdgeInsets.all(6.0),
    decoration: boxDecorationWithRoundedCorners(
      border: Border.all(color: Colors.grey.shade100),
      boxShape: BoxShape.circle,
    ),
    child: Icon(iconData, size: 20, color: color),
  );
}

Widget mlIconWithRoundedContainer(IconData iconData, Color color) {
  return Container(
    padding: EdgeInsets.all(8.0),
    decoration: boxDecorationWithRoundedCorners(backgroundColor: white, border: Border.all(color: Colors.grey.shade100), borderRadius: radius(24)),
    child: Icon(iconData, size: 16, color: color),
  );
}

Widget mlSelectedNavigationbarIcon(IconData iconData) {
  return Container(
    padding: EdgeInsets.all(10.0),
    decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.blue.withOpacity(0.1), borderRadius: radius(24)),
    child: Icon(iconData, size: 22, color: mlColorDarkBlue),
  );
}

Widget mlBackToPreviousWidget(BuildContext context, Color color) {
  return Align(
    alignment: Alignment.topLeft,
    child: IconButton(
      icon: Icon(Icons.arrow_back_ios_outlined, color: color, size: 24),
      onPressed: () {
        finish(context);
      },
    ),
  );
}

Widget mlBackToPreviousIcon(BuildContext context, Color color) {
  return Align(
    alignment: Alignment.topLeft,
    child: Icon(Icons.arrow_back_ios_outlined, color: color, size: 18),
  ).onTap(() {
    finish(context);
  });
}
