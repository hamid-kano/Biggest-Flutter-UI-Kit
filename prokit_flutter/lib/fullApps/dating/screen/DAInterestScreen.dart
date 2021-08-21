import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/model/DatingAppModel.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DAUploadPhotoScreen.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAColors.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DADataGenerator.dart';

class DAInterestScreen extends StatefulWidget {
  @override
  DAInterestScreenState createState() => DAInterestScreenState();
}

class DAInterestScreenState extends State<DAInterestScreen> {
  List<DatingAppModel> list = getInterests();

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
        appBar: appBarWidget('apes', center: true, titleTextStyle: boldTextStyle(size: 25)),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Text('Create your \naccount', style: boldTextStyle(size: 30)),
              16.height,
              Text('Select a few of your interests', style: primaryTextStyle()),
              16.height,
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 4,
                children: list
                    .asMap()
                    .map(
                      (e, i) {
                        return MapEntry(
                          e,
                          Container(
                            width: context.width() * 0.46 - 24,
                            decoration: BoxDecoration(
                              border: Border.all(color: i.mISCheck.validate() ? primaryColor : grey),
                              borderRadius: BorderRadius.circular(10),
                              color: i.mISCheck! ? primaryColor : white,
                            ),
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(8),
                            child: Text(i.name.validate(), style: boldTextStyle(color: i.mISCheck! ? white : black), textAlign: TextAlign.center),
                          ).onTap((){
                            i.mISCheck = !i.mISCheck!;
                            setState(() {});
                          }, splashColor: white,
                            highlightColor: white),
                        );
                      },
                    )
                    .values
                    .toList(),
              ),
              16.height,
              AppButton(
                width: context.width(),
                color: primaryColor,
                onTap: () {
                  finish(context);
                  DAUploadPhotoScreen().launch(context);
                },
                text: 'Continue',
                textStyle: boldTextStyle(color: white),
              ),
            ],
          ).paddingOnly(left: 16, right: 16, bottom: 32),
        ),
      ),
    );
  }
}
