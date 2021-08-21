import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class MWImageScreen extends StatefulWidget {
  static String tag = '/MWImageScreen';

  @override
  MWImageScreenState createState() => MWImageScreenState();
}

class MWImageScreenState extends State<MWImageScreen> {
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
        appBar: appBar(context, 'Image Screen'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Load Image from Asset folder",
                  style: boldTextStyle(color: appStore.textPrimaryColor),
                ),
              ),
              Image.asset(
                'images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item4.jpg',
                fit: BoxFit.cover,
                height: 150,
                width: 130,
              ).paddingLeft(16),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Network Image",
                  style: boldTextStyle(color: appStore.textPrimaryColor),
                ),
              ),
              Image.network('https://killerattitudestatus.in/wp-content/uploads/2019/12/gud-night-images.jpg', fit: BoxFit.cover, width: 130, height: 150.0).paddingLeft(16),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Placeholder",
                  style: boldTextStyle(color: appStore.textPrimaryColor),
                ),
              ),
              FadeInImage(
                height: 150,
                width: 130,
                fit: BoxFit.cover,
                placeholder: AssetImage(
                  'Loading',
                ),
                image: Image.asset(
                  'images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item3.jpg',
                  height: 35,
                  width: 20,
                ).image,
              ).paddingLeft(16),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Shape",
                  style: boldTextStyle(color: appStore.textPrimaryColor),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item7.jpg',
                      fit: BoxFit.cover,
                      height: 150,
                      width: 130,
                    ),
                  ).paddingOnly(right: 16, left: 16),
                  CircleAvatar(
                    backgroundImage: AssetImage('images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item4.jpg'),
                    radius: 40,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
