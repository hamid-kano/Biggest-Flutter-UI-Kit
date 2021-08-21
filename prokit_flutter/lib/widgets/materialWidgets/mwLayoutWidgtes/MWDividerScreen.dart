import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWDividerScreen extends StatefulWidget {
  static String tag = '/MWDividerScreen';

  @override
  MWDividerScreenState createState() => MWDividerScreenState();
}

class MWDividerScreenState extends State<MWDividerScreen> {
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
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Divider'),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Horizontal Divider",
                style: boldTextStyle(),
              ).paddingOnly(top: 16, bottom: 16),
              Divider(
                color: appStore.iconColor,
                thickness: 2,
              ),
              16.height,
              Divider(
                color: Colors.deepOrangeAccent,
                thickness: 6,
              ),
              16.height,
              Row(children: <Widget>[
                Expanded(child: Divider(color: appStore.iconColor)),
                16.width,
                Text(
                  "OR",
                  style: boldTextStyle(),
                ),
                16.width,
                Expanded(child: Divider(color: appStore.iconColor)),
              ]),
              Text(
                "Dashed Divider",
                style: boldTextStyle(),
              ).paddingOnly(top: 30, bottom: 16),
              Separator(
                color: appColorPrimary,
                dashWidth: 20,
                height: 4,
              ),
              20.height,
              Separator(color: Colors.grey),
              Text(
                "Vertical Divider",
                style: boldTextStyle(),
              ).paddingOnly(top: 30, bottom: 16),
              IntrinsicHeight(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Account',
                    style: boldTextStyle(),
                  ),
                  VerticalDivider(
                    color: appStore.iconColor,
                    thickness: 2,
                  ),
                  Text(
                    'Setting',
                    style: boldTextStyle(),
                  ),
                  VerticalDivider(
                    color: appStore.iconColor,
                    thickness: 2,
                  ),
                  Text(
                    'Profile',
                    style: boldTextStyle(),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class Separator extends StatelessWidget {
  final double height;
  final double dashWidth;
  final Color color;

  const Separator({this.height = 1, this.dashWidth = 10, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidths = dashWidth;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidths)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidths,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
