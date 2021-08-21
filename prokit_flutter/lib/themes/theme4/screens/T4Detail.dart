import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme4/models/T4Models.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Constant.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4DataGenerator.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Images.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Strings.dart';
import 'package:prokit_flutter/themes/theme4/utils/widgets/T4Button.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../main.dart';

class T4Detail extends StatefulWidget {
  static var tag = "/T4Description";

  @override
  T4DetailState createState() => T4DetailState();
}

class T4DetailState extends State<T4Detail> {
  int selectedPos = 1;
  late List<T4NewsModel> mListings;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mListings = getList1Data();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      appBar: appBar(context, t4_lbl_single_article),
      body: Observer(
        builder: (_) => Container(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  16.height,
                  Row(
                    children: <Widget>[
                      SizedBox(width: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                          imageUrl: t4_img2,
                          width: (width - 48) * 0.5,
                          height: height * 0.3,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                          imageUrl: t4_img4,
                          width: (width - 48) * 0.5,
                          height: height * 0.3,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: text(t4_samplelong_text, textColor: appStore.textPrimaryColor, fontSize: textSizeMedium, maxLine: 10),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Divider(height: 16),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(t4_profile),
                                radius: 28,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    text(t4_username, textColor: appStore.textPrimaryColor, fontSize: textSizeMedium, fontFamily: fontMedium),
                                    text(t4_designation, fontSize: textSizeMedium)
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              )
                            ],
                          ),
                        ),
                        T4Button(
                          textContent: t4_lbl_follow,
                          isStroked: true,
                          height: 40,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
                    child: text("Related Articles", textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mListings.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ClipRRect(
                                  child: CachedNetworkImage(
                                    placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                                    imageUrl: mListings[index].image,
                                    width: width / 3,
                                    height: width / 3.2,
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            text(mListings[index].name, textColor: appStore.textPrimaryColor, fontSize: textSizeLargeMedium, fontFamily: fontBold),
                                            text(mListings[index].info, fontSize: textSizeMedium, textColor: appStore.textSecondaryColor),
                                            SizedBox(height: 4),
                                            text(mListings[index].otherinfo, fontSize: textSizeSMedium, maxLine: 3),
                                            SizedBox(height: 4),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 16),
                            Divider()
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
