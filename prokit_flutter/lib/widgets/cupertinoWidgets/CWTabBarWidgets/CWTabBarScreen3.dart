import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/Lipsum.dart' as lipsum;

import '../../../main/utils/AppWidget.dart';

class CWTabBarScreen3 extends StatefulWidget {
  static const tag = '/CWTabBarScreen3';

  @override
  CWTabBarScreen3State createState() => CWTabBarScreen3State();
}

class CWTabBarScreen3State extends State<CWTabBarScreen3> {
  int? selectIndex;

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
    Widget mPage(var value) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                value,
                style: boldTextStyle(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 16),
              child: Text(
                lipsum.createParagraph(numSentences: 2),
                style: secondaryTextStyle(),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'TabBar with Custom Image'),
        body: CupertinoTabScaffold(
          resizeToAvoidBottomInset: true,
          tabBar: CupertinoTabBar(
            backgroundColor: appStore.appBarColor,
            onTap: (i) {
              selectIndex = i;
              setState(() {});
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: selectIndex == 3 ? appColorPrimary : Colors.transparent, width: 2)),
                  child: CachedNetworkImage(
                    imageUrl: 'https://www.attractivepartners.co.uk/wp-content/uploads/2017/06/profile.jpg',
                  ).cornerRadiusWithClipRRect(30.0),
                ),
              ),
            ],
            activeColor: appColorPrimary,
            inactiveColor: Colors.grey,
          ),
          tabBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return mPage("Home");
              case 1:
                return mPage("Favourite");
              case 2:
                return mPage("Cart");
              default:
                return mPage("Profile");
            }
          },
        ),
      ),
    );
  }
}
