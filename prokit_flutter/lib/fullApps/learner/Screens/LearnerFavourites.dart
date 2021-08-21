import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/learner/model/LearnerModels.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerConstant.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerDataGenerator.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerImages.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LearnerFavourites extends StatefulWidget {
  @override
  _LearnerFavouritesState createState() => _LearnerFavouritesState();
}

class _LearnerFavouritesState extends State<LearnerFavourites> {
  late List<LearnerFeaturedModel> mListings1;

  @override
  void initState() {
    super.initState();
    mListings1 = learnerGetFavourites();
  }

  @override
  Widget build(BuildContext context) {
    final topView = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 16),
            child: text(learner_lbl_favourites, fontFamily: fontBold, fontSize: textSizeNormal, textColor: learner_textColorPrimary),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[Image.asset(learner_ic_fab_back, width: 40, height: 40), Icon(Icons.search, color: learner_colorPrimary)],
          ),
        ),
      ],
    );

    final cardList = ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: mListings1.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: boxDecoration(showShadow: true, bgColor: learner_white, radius: 10.0),
            margin: EdgeInsets.only(left: 24, right: 24, bottom: 16),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    child: CachedNetworkImage(
                      placeholder: (_, s) => placeholderWidget(),
                      imageUrl: mListings1[index].img,
                      height: 50,
                      width: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text(mListings1[index].name, fontFamily: fontBold, textColor: learner_textColorPrimary),
                                  SizedBox(height: 4),
                                  text(mListings1[index].type, textColor: learner_textColorPrimary),
                                ],
                              ),
                            ),
                            Icon(Icons.favorite, color: Colors.red, size: 30),
                          ],
                        ),
                        Divider(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text("20", fontFamily: fontBold, textColor: learner_textColorPrimary),
                                SizedBox(height: 4),
                                text("Students", textColor: learner_textColorSecondary),
                              ],
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text("51", fontFamily: fontBold, textColor: learner_textColorPrimary),
                                  SizedBox(height: 4),
                                  text("Lectures", textColor: learner_textColorSecondary),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(8))),
                              child: text(mListings1[index].price, textColor: learner_white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });

    return SafeArea(
      child: Scaffold(
        backgroundColor: learner_layout_background,
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 8),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: learner_colorPrimary),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  topView,
                  cardList,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
