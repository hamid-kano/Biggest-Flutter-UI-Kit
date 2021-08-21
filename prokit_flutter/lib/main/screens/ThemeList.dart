import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/model/AppModel.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppImages.dart';
import 'package:prokit_flutter/main/utils/AppStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'ProKitScreenListing.dart';

class ThemeList extends StatefulWidget {
  final List<ProTheme>? list;

  ThemeList(this.list);

  @override
  ThemeListState createState() => ThemeListState();
}

class ThemeListState extends State<ThemeList> {
  List<Color> colors = [appCat1, appCat2, appCat3];

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return AnimationLimiter(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.list!.length,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: Duration(milliseconds: 600),
            child: FadeInAnimation(
              child: GestureDetector(
                onTap: () {
                  if (appStore.isDarkModeOn) {
                    appStore.toggleDarkMode(value: widget.list![index].darkThemeSupported.validate());
                  }

                  if (widget.list![index].sub_kits == null || widget.list![index].sub_kits!.isEmpty) {
                    if (widget.list![index].widget != null) {
                      log('Tag ${widget.list![index].widget!.key}');

                      widget.list![index].widget.launch(context);
                    } else {
                      toast(appComingSoon);
                    }
                  } else {
                    ProKitScreenListing(widget.list![index]).launch(context);
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 80,
                        margin: EdgeInsets.only(right: 12),
                        padding: EdgeInsets.all(16),
                        child: Image.asset(icons[index % icons.length], color: Colors.white),
                        decoration: boxDecoration(bgColor: colors[index % colors.length], radius: 4),
                      ),
                      Expanded(
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: <Widget>[
                            Container(
                              width: width,
                              height: 80,
                              padding: EdgeInsets.only(left: 16, right: 16),
                              margin: EdgeInsets.only(right: width / 28),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('${widget.list![index].name.validate()}', style: boldTextStyle(), maxLines: 2),
                                      Text(
                                        widget.list![index].title_name.validate(),
                                        style: secondaryTextStyle(),
                                      ).visible(widget.list![index].title_name.validate().isNotEmpty),
                                    ],
                                  ).expand(),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 25,
                                    margin: EdgeInsets.only(right: 8),
                                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    decoration: widget.list![index].type.validate().isNotEmpty ? boxDecoration(bgColor: appDarkRed, radius: 4) : BoxDecoration(),
                                    child: text(widget.list![index].type.validate(), fontSize: 14.0, textColor: whiteColor),
                                  )
                                ],
                              ),
                              decoration: boxDecoration(bgColor: appStore.scaffoldBackground, radius: 4, showShadow: true),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              child: Icon(Icons.keyboard_arrow_right, color: Colors.white),
                              decoration: BoxDecoration(color: colors[index % colors.length], shape: BoxShape.circle),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
