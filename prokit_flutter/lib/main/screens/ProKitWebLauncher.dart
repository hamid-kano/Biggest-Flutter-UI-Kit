import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTDashboardScreen.dart';
import 'package:prokit_flutter/integrations/utils/colors.dart';
import 'package:prokit_flutter/main/model/AppModel.dart';
import 'package:prokit_flutter/main/utils/AppImages.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/webApps/portfolios/portfolio1/Portfolio1Screen.dart';
import 'package:prokit_flutter/webApps/portfolios/portfolio2/Portfolio2Screen.dart';
import 'package:prokit_flutter/webApps/portfolios/portfolio3/Portfolio3Screen.dart';

import '../../main.dart';
import 'SettingScreen.dart';

class ProKitWebLauncher extends StatefulWidget {
  static String tag = '/ProKitWebLauncher';

  @override
  ProKitWebLauncherState createState() => ProKitWebLauncherState();
}

class ProKitWebLauncherState extends State<ProKitWebLauncher> {
  List<ProTheme> list = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    list.add(ProTheme(name: 'Default Theme', type: '', show_cover: false, widget: DTDashboardScreen(), darkThemeSupported: true));
    list.add(ProTheme(name: 'Portfolio 1', type: '', show_cover: false, widget: Portfolio1Screen(), darkThemeSupported: true));
    list.add(ProTheme(name: 'Portfolio 2', type: '', show_cover: false, widget: Portfolio2Screen(), darkThemeSupported: true));
    list.add(ProTheme(name: 'Portfolio 3', type: '', show_cover: false, widget: Portfolio3Screen(), darkThemeSupported: true));

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [appCat1, appCat2, appCat3];

    return Observer(
      builder: (_) => Scaffold(
        appBar: appBar(
          context,
          'Dashboard',
          actions: [
            IconButton(
              icon: Icon(Icons.settings, color: appStore.backgroundColor),
              onPressed: () {
                SettingScreen().launch(context);
              },
            )
          ],
          showBack: false,
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: list
                  .asMap()
                  .map(
                    (index, e) {
                      return MapEntry(
                        index,
                        Container(
                          height: 200,
                          width: 200,
                          margin: EdgeInsets.all(8),
                          decoration: boxDecoration(bgColor: colors[index % colors.length], radius: 4),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(icons[index], color: Colors.white, height: 100),
                              16.height,
                              Text(e.name!, style: boldTextStyle(size: 20, color: Colors.white)),
                            ],
                          ),
                        ).onTap(() {
                          e.widget.launch(context);
                        }),
                      );
                    },
                  )
                  .values
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
