import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/model/NBModel.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBDataProviders.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBWidgets.dart';

class NBCategoryScreen extends StatefulWidget {
  static String tag = '/NBCategoryScreen';

  @override
  NBCategoryScreenState createState() => NBCategoryScreenState();
}

class NBCategoryScreenState extends State<NBCategoryScreen> {
  List<NBCategoryItemModel> mCategoryList = nbGetCategoryItems();

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
      appBar: nbAppBarWidget(context, title: 'Categories'),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return;
        } as bool Function(OverscrollIndicatorNotification)?,
        child: GridView.builder(
          itemCount: mCategoryList.length,
          shrinkWrap: true,
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: <Widget>[
                Image.asset(
                  mCategoryList[index].image,
                  fit: BoxFit.cover,
                  width: context.width(),
                  height: context.height(),
                ).cornerRadiusWithClipRRect(16),
                Container(
                  alignment: Alignment.center,
                  width: context.width(),
                  height: context.height(),
                  color: black.withOpacity(0.5),
                  child: Text(
                    mCategoryList[index].name,
                    style: boldTextStyle(color: white),
                  ),
                ).cornerRadiusWithClipRRect(16),
              ],
            ).onTap(() {
              finish(context);
            });
          },
        ),
      ),
    );
  }
}
