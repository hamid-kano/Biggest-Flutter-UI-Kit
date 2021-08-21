import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLOrderSuccessComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLDashboardScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLImage.dart';

class MLConfirmOrderScreen extends StatefulWidget {
  static String tag = '/MLConfirmOrderScreen';

  @override
  MLConfirmOrderScreenState createState() => MLConfirmOrderScreenState();
}

class MLConfirmOrderScreenState extends State<MLConfirmOrderScreen> {
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
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 230,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: mlPrimaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(ml_ic_order_success!, fit: BoxFit.contain, height: 150, width: context.width() * 0.50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Order Success', style: boldTextStyle(color: white, size: 24)),
                              8.width,
                              Icon(Icons.check_circle, color: white, size: 24),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index == 0) {
                        return MLOrderSuccessComponent();
                      }
                    },
                  ),
                ),
              ],
            ),
            AppButton(
              color: mlColorDarkBlue,
              width: context.width(),
              onTap: () {
                finish(context);
                finish(context);
                finish(context);
                MLDashboardScreen().launch(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Start a New Order', style: boldTextStyle(color: white)),
                  8.width,
                  Icon(Icons.shopping_bag_outlined, color: white, size: 16),
                ],
              ),
            ).paddingOnly(
              right: 16,
              left: 16,
              bottom: 18,
            )
          ],
        ),
      ),
    );
  }
}
