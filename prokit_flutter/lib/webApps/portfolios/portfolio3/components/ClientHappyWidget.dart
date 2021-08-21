import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/DataGenerator.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/Images.dart';

import '../../../../main.dart';
import '../Colors.dart';

class ClientHappyWidget extends StatefulWidget {
  static String tag = '/ClientHappyWidget';

  @override
  ClientHappyWidgetState createState() => ClientHappyWidgetState();
}

class ClientHappyWidgetState extends State<ClientHappyWidget> {
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
    return Container(
      width: context.width(),
      child: Stack(
        children: [
          commonCachedNetworkImage(
            p3IntoImg,
            height: context.height() * 0.6,
            width: context.width(),
            fit: BoxFit.cover,
          ),
          Container(
            height: context.height() * 0.6,
            width: context.width(),
            color: Colors.black.withOpacity(0.7),
          ),
          Center(
            child: Container(
              width: context.width() * 0.85,
              margin: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  32.height,
                  Text(
                    'Happy Clients Says',
                    style: boldTextStyle(
                      size: 45,
                      color: white,
                      decorationColor: portfolio3PrimaryColor,
                      textDecorationStyle: TextDecorationStyle.solid,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  16.height,
                  Container(
                    width: context.width() * 0.85,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: getClientHappyList().map(
                          (e) {
                            log(e.img);
                            return Container(
                              margin: EdgeInsets.all(12),
                              width: context.width() * 0.25,
                              decoration: boxDecorationWithRoundedCorners(backgroundColor: appStore.appBarColor!, borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  16.height,
                                  commonCachedNetworkImage(e.img!, width: 60, height: 60, fit: BoxFit.cover).cornerRadiusWithClipRRect(30),
                                  16.height,
                                  Text(e.name!, style: boldTextStyle(size: 24), maxLines: 2),
                                  16.height,
                                  Text(
                                    e.detail!,
                                    style: primaryTextStyle(size: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                  16.height,
                                ],
                              ).paddingAll(16),
                            ).onTap(() {});
                          },
                        ).toList(),
                      ),
                    ),
                  ).center(),
                ],
              ),
            ).withWidth(context.width() * 0.85),
          )
        ],
      ),
    );
  }
}
