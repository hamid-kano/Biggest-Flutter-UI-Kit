import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme6/models/T6Models.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6SliderWidget.dart';

import '../../../../main.dart';
import '../T6Colors.dart';
import '../T6Constant.dart';

// ignore: must_be_immutable
class T6SliderWidget extends StatelessWidget {
  List<T6Slider>? mSliderList;

  T6SliderWidget(this.mSliderList);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;

    return T6CarouselSlider(
      viewportFraction: 0.9,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      items: mSliderList!.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: boxDecoration(radius: 16, showShadow: true, bgColor: appStore.scaffoldBackground),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      child: CachedNetworkImage(placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?, imageUrl: slider.Image, height: 180, width: width, fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            text(slider.name, textColor: appStore.textPrimaryColor, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                            RichText(
                              text: TextSpan(
                                style: Theme.of(context).textTheme.bodyText2,
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                                      child: Icon(
                                        Icons.access_time,
                                        color: t6icon_color,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  TextSpan(text: slider.duration, style: TextStyle(fontSize: textSizeSMedium, color: t6textColorSecondary)),
                                ],
                              ),
                            )
                          ],
                        ),
                        text(slider.info),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
