import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/Images.dart';

import '../Colors.dart';

class ProjectDetailWidget extends StatefulWidget {
  static String tag = '/ProjectDetailWidget';

  @override
  ProjectDetailWidgetState createState() => ProjectDetailWidgetState();
}

class ProjectDetailWidgetState extends State<ProjectDetailWidget> {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          16.height,
          Divider(height: 0),
          32.height,
          commonCachedNetworkImage(
            p2MockUp,
            height: context.height() * 0.65,
            width: context.width() * 0.65,
          ),
          Text(
            'Passionate designer & developer who loves simplicity.',
            style: boldTextStyle(size: 32),
            textAlign: TextAlign.center,
          ),
          8.height,
          Text('Fusce fringilla tincidunt laoreet volutpat cras varius sit suscipit.', style: secondaryTextStyle(size: 18), textAlign: TextAlign.center),
          8.height,
          Text(
                  'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laboriosam totam id dolorem, nobis aperiam'
                  'vero reprehenderit quae explicabo fugiat modi eius quos voluptatum ratione dolorum placeat aliquid rerum, at sapiente'
                  'provident consequuntur. Vero sed hic omnis, odit in ipsam facilis beatae, assumenda dolore necessitatibus sequi?',
                  style: secondaryTextStyle(size: 14),
                  textAlign: TextAlign.center)
              .withWidth(context.width() * 0.7),
          24.height,
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              primary: portfolio2PrimaryColor,
              padding: EdgeInsets.only(top: 20, bottom: 20, left: 32, right: 32),
            ),
            child: Text('View my project', style: boldTextStyle(color: Colors.white)),
          ),
          32.height
        ],
      ),
    );
  }
}
