import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTFAQDetailScreen.dart';
import 'package:prokit_flutter/defaultTheme/utils/DTWidgets.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';
import 'DTDrawerWidget.dart';

class DTFAQScreen extends StatefulWidget {
  static String tag = '/DTFAQScreen';

  @override
  DTFAQScreenState createState() => DTFAQScreenState();
}

class DTFAQScreenState extends State<DTFAQScreen> {
  var categories =[];
  int selectIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    categories.add('Payment');
    categories.add('Coupons');
    categories.add('Reservation');
    categories.add('Waiting');
    categories.add('Payment');
    categories.add('Coupons');
    categories.add('Reservation');
    categories.add('Waiting');

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget listing() {
      return ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: categories.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              DTFAQDetailScreen().launch(context);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(top: 8, bottom: 8),
              decoration: BoxDecoration(color: appStore.appBarColor, boxShadow: defaultBoxShadow()),
              width: context.width(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(LoremText, style: primaryTextStyle(size: 14), maxLines: 2),
                  ),
                  Icon(Icons.chevron_right, color: appStore.iconColor)
                ],
              ).paddingAll(8),
            ),
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'FAQ'),
        drawer: DTDrawerWidget(),
        body: Observer(
          builder: (_) => Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                height: 200,
                child: Container(
                  height: 200,
                  width: context.width(),
                  decoration: BoxDecoration(gradient: defaultThemeGradient()),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.center,
                  child: Text('How can we help you?', textAlign: TextAlign.center, style: boldTextStyle(size: 26, color: white)),
                ),
              ),
              Positioned(
                top: 190,
                child: Container(
                  width: context.width(),
                  height: context.height() - 268,
                  decoration: BoxDecoration(
                    color: appStore.scaffoldBackground,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14)),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 30, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Top Questions', style: primaryTextStyle(size: 18)).paddingOnly(left: 8, right: 8),
                        16.height,
                        Container(
                          height: 50,
                          child: ListView.builder(
                            itemCount: categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {
                                  selectIndex = index;
                                  setState(() {});
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
                                  margin: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                                  decoration: BoxDecoration(
                                    gradient: selectIndex == index ? defaultThemeGradient() : LinearGradient(colors: [appStore.appBarColor!, appStore.appBarColor!]),
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    border: Border.all(color: Colors.black12, width: 0.5),
                                  ),
                                  child: Text(
                                    categories[index],
                                    style: primaryTextStyle(size: 14, color: selectIndex == index ? white : appStore.textPrimaryColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        8.height,
                        listing(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
