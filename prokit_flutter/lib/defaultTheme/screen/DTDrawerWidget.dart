import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTDashboardScreen.dart';
import 'package:prokit_flutter/defaultTheme/utils/DTDataProvider.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/screens/ProKitLauncher.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/widgets/materialWidgets/mwAppStrucutreWidgets/MWDrawerWidgets/MWDrawerScreen2.dart';

import '../../main.dart';

class DTDrawerWidget extends StatefulWidget {
  static String tag = '/DTDrawerWidget';

  @override
  DTDrawerWidgetState createState() => DTDrawerWidgetState();
}

class DTDrawerWidgetState extends State<DTDrawerWidget> {
  List<ListModel> drawerItems = getDrawerItems();
  var scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    if (appStore.selectedDrawerItem > 7) {
      await Future.delayed(Duration(milliseconds: 300));
      scrollController.jumpTo(appStore.selectedDrawerItem * 27.0);

      setState(() {});
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipPath(
        clipper: OvalRightBorderClipper(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Drawer(
          child: Container(
            color: appStore.scaffoldBackground,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  16.height,
                  Text('Screens', style: secondaryTextStyle(size: 12)).paddingOnly(left: 16),
                  4.height,
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text('Home', style: boldTextStyle(color: appColorPrimary)),
                  ).onTap(() {
                    appStore.setDrawerItemIndex(-1);

                    if (isMobile) {
                      ProKitLauncher().launch(context, isNewTask: true);
                    } else {
                      DTDashboardScreen().launch(context, isNewTask: true);
                    }
                  }),
                  Divider(height: 16, color: viewLineColor),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: appStore.selectedDrawerItem == index ? appColorPrimary.withOpacity(0.3) : appStore.scaffoldBackground,
                        ),
                        child: Text(
                          drawerItems[index].name!,
                          style: boldTextStyle(color: appStore.selectedDrawerItem == index ? appColorPrimary : appStore.textPrimaryColor),
                        ),
                      ).onTap(() {
                        finish(context);
                        appStore.setDrawerItemIndex(index);

                        drawerItems[index].widget.launch(context);
                      });
                    },
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    itemCount: drawerItems.length,
                    shrinkWrap: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
