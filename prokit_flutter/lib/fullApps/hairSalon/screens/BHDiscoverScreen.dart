import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/hairSalon/model/BHModel.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHConstants.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHDataProvider.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'BHDetailScreen.dart';
import 'BHNotificationScreen.dart';
import 'BHSpecialListViewAllScreen.dart';
import 'BHSpecialOfferViewAllScreen.dart';

class BHDiscoverScreen extends StatefulWidget {
  static String tag = '/DiscoverBottomNavigationBarScreen';

  @override
  BHDiscoverScreenState createState() => BHDiscoverScreenState();
}

class BHDiscoverScreenState extends State<BHDiscoverScreen> {
  late List<BHBestSpecialModel> bestSpecialList;
  late List<BHSpecialOfferModel> specialOfferList;
  late List<BHBestSpecialModel> bestSpecialNewList;
  late List<BHSpecialOfferModel> specialOfferNewList;

  @override
  void initState() {
    super.initState();
    bestSpecialList = getSpecialList();
    specialOfferList = getSpecialOfferList();
    bestSpecialNewList = getSpecialNewList();
    specialOfferNewList = getSpecialOfferNewList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Hi', style: TextStyle(fontSize: 18, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold)),
                      8.width,
                      Text('Theresa Cohen,', style: TextStyle(fontSize: 18, color: BHColorPrimary, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  GestureDetector(
                    child: Icon(Icons.notifications, color: BHColorPrimary, size: 22),
                    onTap: () {
                      BHNotificationScreen().launch(context);
                    },
                  )
                ],
              ),
              16.height,
              Row(
                children: [
                  Icon(Icons.location_on, size: 16),
                  Text('301 Dorthy walks,chicago,Us.', style: TextStyle(fontSize: 16, color: BHAppTextColorSecondary)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        hintText: 'Find salon specialist',
                        prefixIcon: Icon(Icons.search, color: BHGreyColor),
                        hintStyle: TextStyle(color: BHGreyColor),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: BHAppDividerColor, width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: BHAppDividerColor, width: 0.5),
                        ),
                      ),
                    ),
                  ).expand(),
                  8.width,
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(right: 14),
                    height: 45,
                    child: Icon(Icons.filter_list, color: Colors.grey),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: BHAppDividerColor, width: 0.5),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(BHTxtBestSpecialists, style: TextStyle(fontSize: 16, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      sendTextData(context);
                    },
                    child: Text(BHTxtViewAll, style: TextStyle(fontSize: 14, color: BHColorPrimary, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: bestSpecialList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        BHDetailScreen().launch(context);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.fromLTRB(8, 8, 16, 8),
                        shadowColor: BHGreyColor.withOpacity(0.3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                              child: commonCacheImageWidget(bestSpecialList[index].img, 110, width: 120, fit: BoxFit.cover),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                bestSpecialList[index].title!,
                                style: TextStyle(fontSize: 16, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                bestSpecialList[index].subTitle!,
                                style: TextStyle(fontSize: 12, color: BHAppTextColorSecondary),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(BHTxtSpecialOffers, style: TextStyle(fontSize: 16, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      sendTextDataOffer(context);
                    },
                    child: Text(BHTxtViewAll, style: TextStyle(fontSize: 14, color: BHColorPrimary, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  itemCount: specialOfferList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        BHDetailScreen().launch(context);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.fromLTRB(0, 8, 16, 8),
                        shadowColor: BHGreyColor.withOpacity(0.3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                              child: commonCacheImageWidget(specialOfferList[index].img, 100, width: 200, fit: BoxFit.cover),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                specialOfferList[index].title!,
                                style: TextStyle(fontSize: 16, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                              child: Text(
                                specialOfferList[index].subtitle!,
                                style: TextStyle(fontSize: 12, color: BHAppTextColorSecondary),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    BHTxtSalonSpecialLists,
                    style: TextStyle(fontSize: 16, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      sendTextData(context);
                    },
                    child: Text(
                      BHTxtViewAll,
                      style: TextStyle(fontSize: 14, color: BHColorPrimary, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                height: 204,
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(0, 8, 16, 8),
                  itemCount: bestSpecialNewList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        BHDetailScreen().launch(context);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.fromLTRB(0, 8, 16, 8),
                        shadowColor: BHGreyColor.withOpacity(0.3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                              child: Container(
                                child: commonCacheImageWidget(bestSpecialNewList[index].img, 110, width: 120, fit: BoxFit.cover),
                              ),
                            ),
                            10.height,
                            Container(
                              padding: EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bestSpecialNewList[index].title!,
                                    style: TextStyle(fontSize: 16, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold),
                                  ),
                                  5.height,
                                  Text(
                                    bestSpecialNewList[index].subTitle!,
                                    style: TextStyle(fontSize: 12, color: BHAppTextColorSecondary),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(BHTxtSalonServices, style: TextStyle(fontSize: 16, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      sendTextDataOffer(context);
                    },
                    child: Text(BHTxtViewAll, style: TextStyle(fontSize: 14, color: BHColorPrimary, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(0, 8, 16, 8),
                  itemCount: specialOfferNewList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        BHDetailScreen().launch(context);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.fromLTRB(0, 8, 16, 8),
                        shadowColor: BHGreyColor.withOpacity(0.3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                              child: commonCacheImageWidget(specialOfferNewList[index].img, 100, width: 200, fit: BoxFit.cover),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                specialOfferNewList[index].title!,
                                style: TextStyle(fontSize: 16, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8, left: 8, bottom: 8),
                              child: Text(specialOfferNewList[index].subtitle!, style: TextStyle(fontSize: 12, color: BHAppTextColorSecondary)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendTextData(BuildContext context) {
    String textData = 'Best Specialists';
    BHSpecialListViewAllScreen(specialList: textData).launch(context);
  }

  void sendTextDataOffer(BuildContext context) {
    String sendOfferText = 'Special Offers';
    BHSpecialOfferViewAllScreen(offerData: sendOfferText).launch(context);
  }
}
