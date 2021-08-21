import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';

import '../../../main.dart';

class MWBottomSheetScreen extends StatefulWidget {
  static String tag = '/MWBottomSheetScreen';

  @override
  MWBottomSheetScreenState createState() => MWBottomSheetScreenState();
}

class MWBottomSheetScreenState extends State<MWBottomSheetScreen> {
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

  List<ListModel> example = [
    ListModel(name: 'Simple Bottom Sheet'),
    ListModel(name: 'Bottom Sheet with rounded corner'),
    ListModel(name: 'Bottom Sheet with scrollable content'),
    ListModel(name: 'Bottom Sheet with Form'),
  ];

  @override
  Widget build(BuildContext context) {
    void mSimpleBottomSheet() {
      Widget mOption(var icon, var value) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: appStore.iconColor,
              ),
              16.width,
              Text(value, style: primaryTextStyle(size: 16, color: appStore.textPrimaryColor))
            ],
          ),
        );
      }

      showModalBottomSheet(
          context: context,
          backgroundColor: appStore.scaffoldBackground,
          builder: (builder) {
            return Container(
              height: 160.0,
              color: Colors.transparent,
              child: Column(
                children: [
                  mOption(Icons.share, "Share").onTap(() {
                    finish(context);
                    toast('share');
                  }),
                  mOption(Icons.link, "Get Link").onTap(() {
                    finish(context);
                    toast('Get Link');
                  }),
                  mOption(Icons.edit, "Edit Name").onTap(() {
                    finish(context);
                    toast('Edit Name');
                  }),
                ],
              ),
            );
          });
    }

    return Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        appBar: appBar(context, 'Bottom Sheet'),
        body: ListView.builder(
            itemCount: example.length,
            itemBuilder: (BuildContext context, index) {
              return ExampleItemWidget(example[index], onTap: () {
                if (index == 0) {
                  mSimpleBottomSheet();
                } else if (index == 1) {
                  mCornerBottomSheet(context);
                } else if (index == 2) {
                  mExpandedSheet(context);
                } else if (index == 3) {
                  mFormBottomSheet(context);
                }
              });
            }));
  }
}

mCornerBottomSheet(BuildContext aContext) {
  showModalBottomSheet(
      context: aContext,
      backgroundColor: appStore.scaffoldBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (builder) {
        return Container(
          height: 250.0,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Information",
                style: boldTextStyle(color: appStore.textPrimaryColor),
              ),
              16.height,
              Divider(height: 5, color: appDividerColor.withOpacity(0.5)),
              16.height,
              Text("Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
                  style: secondaryTextStyle(color: appStore.textSecondaryColor)),
              8.height,
            ],
          ),
        );
      });
}

mExpandedSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    backgroundColor: Colors.transparent,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.45,
      minChildSize: 0.2,
      maxChildSize: 1,
      builder: (context, scrollController) {
        return Container(
          color: appStore.scaffoldBackground,
          child: GestureDetector(
            onTap: () {
              finish(context);
            },
            child: ListView.builder(
              controller: scrollController,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'Item $index',
                    style: primaryTextStyle(color: appStore.textPrimaryColor),
                  ),
                );
              },
              itemCount: 20,
            ),
          ),
        );
      },
    ),
  );
}

mFormBottomSheet(BuildContext aContext) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: aContext,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)), color: appStore.appBarColor),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Add Review",
              style: boldTextStyle(color: appStore.textPrimaryColor),
            ),
            Divider().paddingOnly(top: 16, bottom: 16),
            Text(
              "Email",
              style: primaryTextStyle(color: appStore.textPrimaryColor),
            ),
            8.height,
            editTextStyle("Enter Email"),
            16.height,
            Text(
              "Description",
              style: primaryTextStyle(color: appStore.textPrimaryColor),
            ),
            8.height,
            editTextStyle("Description"),
            16.height,
            RatingBar(
              initialRating: 5,
              minRating: 5,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ).center(),
            30.height,
            GestureDetector(
              onTap: () {
                finish(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: boxDecoration(bgColor: appColorPrimary, radius: 16),
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Center(
                  child: Text(
                    "Submit",
                    style: primaryTextStyle(color: white),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

Padding editTextStyle(var hintText) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: TextFormField(
      style: TextStyle(fontSize: 16, fontFamily: fontRegular),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(24, 16, 24, 16),
        hintText: hintText,
        hintStyle: primaryTextStyle(color: appStore.isDarkModeOn ? white.withOpacity(0.5) : grey),
        filled: true,
        fillColor: appStore.appBarColor,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: appStore.iconSecondaryColor!, width: 1.0)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: appStore.iconSecondaryColor!, width: 1.0)),
      ),
    ),
  );
}
