import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLCheckOutComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLShoppingCartComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';

import 'MLConfirmOrderScreen.dart';

class MLAddToCartScreen extends StatefulWidget {
  static String tag = '/MLShoppingCartScreen';

  @override
  MLAddToCartScreenState createState() => MLAddToCartScreenState();
}

class MLAddToCartScreenState extends State<MLAddToCartScreen> {
  int currentWidget = 0;

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: mlPrimaryColor,
        body: Stack(
          children: [
            Container(
              height: context.height(),
              decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topRight: 32)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    8.height,
                    Row(
                      children: [
                        Icon(Icons.arrow_back_ios, color: blackColor, size: 24).onTap(() {
                          currentWidget == 0
                              ? Navigator.of(context).pop()
                              : setState(() {
                                  currentWidget--;
                                });
                        }),
                        currentWidget == 0
                            ? Row(
                                children: [
                                  Text('Shopping Cart', style: boldTextStyle(size: 24)),
                                  8.width,
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: boxDecorationWithRoundedCorners(backgroundColor: mlColorDarkBlue, boxShape: BoxShape.circle),
                                    child: Text('3', style: secondaryTextStyle(size: 18, color: white)),
                                  ),
                                ],
                              )
                            : Text('Check Out', style: boldTextStyle(size: 24)),
                      ],
                    ).paddingAll(16.0),
                    8.height,
                    Column(
                      children: [
                        Divider(height: 0.5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Address Shipping', style: boldTextStyle()).expand(),
                                Text('Change', style: boldTextStyle(color: mlColorBlue)),
                              ],
                            ),
                            8.height,
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined, color: Colors.grey.shade500, size: 18),
                                4.width,
                                Text('23 Estean, New York City, USA', style: secondaryTextStyle(color: Colors.grey.shade500)),
                              ],
                            )
                          ],
                        ).paddingAll(16.0),
                        Divider(height: 0.5),
                        currentWidget == 0 ? MLShoppingCartComponent() : MLCheckOutComponent(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                width: context.width(),
                padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0, top: 8.0),
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radius(0.0),
                  backgroundColor: white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 0.0)],
                ),
                child: currentWidget == 0
                    ? Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          8.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total', style: secondaryTextStyle(size: 16)),
                              Text('\$250.00', style: boldTextStyle()),
                            ],
                          ),
                          32.width,
                          AppButton(
                            color: mlColorDarkBlue,
                            onTap: () {
                              setState(() {
                                currentWidget++;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Check Out', style: boldTextStyle(color: white)),
                                4.width,
                                Icon(Icons.arrow_forward_ios, color: white, size: 16),
                              ],
                            ),
                          ).expand()
                        ],
                      )
                    : AppButton(
                        color: mlColorDarkBlue,
                        width: context.width() / 2,
                        onTap: () {
                          setState(() {
                            MLConfirmOrderScreen().launch(context);
                          });
                        },
                        child: Text('Confirm', style: secondaryTextStyle(color: white)),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
