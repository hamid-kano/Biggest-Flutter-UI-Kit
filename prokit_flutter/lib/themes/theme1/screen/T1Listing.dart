import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme1/model/T1_model.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Colors.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Constant.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1DataGenerator.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Strings.dart';

class T1Listing extends StatefulWidget {
  static var tag = "/T1Listing";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return T1ListingState();
  }
}

class T1ListingState extends State<T1Listing> {
  late List<T1Model> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getListings();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      appBar: appBar(context, t1_Listing),
      body: Observer(
        builder: (_) => Container(
          child: Column(
            children: <Widget>[
              16.height,
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mListings.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return T1ListItem(mListings[index], index);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class T1ListItem extends StatelessWidget {
  late T1Model model;
  late int pos;

  T1ListItem(T1Model model, int pos) {
    this.model = model;
    this.pos = pos;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Container(
          decoration: boxDecoration(bgColor: appStore.scaffoldBackground, radius: 10, showShadow: true),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        ClipRRect(
                          child: CachedNetworkImage(
                            placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                            imageUrl: model.img,
                            width: width / 5.5,
                            height: width / 6,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    text(model.name, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal, maxLine: 2),
                                    text(model.duration, textColor: appStore.textSecondaryColor, fontSize: textSizeMedium),
                                  ],
                                ),
                                text(model.designation, fontSize: textSizeLargeMedium, textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
                              ],
                            ),
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    SizedBox(height: 16),
                    text(t1_samplelong_text, fontSize: textSizeMedium, maxLine: 2, textColor: appStore.textPrimaryColor),
                  ],
                ),
              ),
              Container(
                width: 4,
                height: 35,
                margin: EdgeInsets.only(top: 16),
                color: pos % 2 == 0 ? t1TextColorPrimary : t1_colorPrimary,
              )
            ],
          ),
        ));
  }
}
