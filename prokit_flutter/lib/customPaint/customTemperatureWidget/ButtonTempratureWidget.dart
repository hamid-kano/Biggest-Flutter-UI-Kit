import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';

class ButtonTemperatureType extends StatelessWidget {
  const ButtonTemperatureType({
    Key? key,
    @required this.iconData,
    @required this.status,
  }) : super(key: key);
  final IconData? iconData;
  final bool? status;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: status! ? context.cardColor.withOpacity(0.8) : context.cardColor,
      ),
      child: Icon(iconData, size: 35.0, color: status! ? appColorPrimary : context.iconColor),
    ).onTap(() {}, borderRadius: radius(20));
  }
}
