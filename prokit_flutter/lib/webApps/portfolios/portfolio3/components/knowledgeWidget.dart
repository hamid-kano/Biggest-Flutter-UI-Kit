import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/Images.dart';

import '../Colors.dart';

// ignore: camel_case_types
class knowledgeWidget extends StatefulWidget {
  static String tag = '/knowledgeWidget';

  @override
  knowledgeWidgetState createState() => knowledgeWidgetState();
}

// ignore: camel_case_types
class knowledgeWidgetState extends State<knowledgeWidget> {
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
      height: context.height(),
      width: context.width(),
      child: Stack(
        children: [
          commonCachedNetworkImage(
            p3knowledge,
            height: context.height(),
            width: context.width(),
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
            height: context.height(),
            width: context.width(),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Imagination is more \nimportant than knowledge',
                  style: boldTextStyle(size: 55, color: white),
                  textAlign: TextAlign.center,
                ),
                16.height,
                Container(
                  height: 80,
                  width: 80,
                  padding: EdgeInsets.all(16),
                  decoration: boxDecorationRoundedWithShadow(40, backgroundColor: Colors.white),
                  child: Icon(Icons.play_arrow, size: 30, color: portfolio3PrimaryColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
