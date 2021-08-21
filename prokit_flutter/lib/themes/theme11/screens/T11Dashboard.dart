import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme11/models/T11Models.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Colors.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Constant.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11DataGenerator.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Images.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Strings.dart';

class T11Dashboard extends StatefulWidget {
  static String tag = '/T11Dashboard';

  @override
  _T11DashboardState createState() => _T11DashboardState();
}

class _T11DashboardState extends State<T11Dashboard> {
  late List<Theme11SongType> mList1;
  late List<Theme11SongsList> mList2;

  var selectedIndex = 0;
  var selectedSongType = 0;

  @override
  void initState() {
    super.initState();
    mList1 = theme11songTypeList();
    mList2 = theme11SongList();
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      print(selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchView = Container(
      height: 80,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: whiteColor,
          hintText: t11_lbl_search_Title,
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search, color: t11_PrimaryColor).paddingAll(16),
          contentPadding: EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0, right: 16.0),
        ),
      ).cornerRadiusWithClipRRect(20),
      alignment: Alignment.center,
    ).cornerRadiusWithClipRRect(10).paddingAll(16);

    final songDetail = Row(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: t11_ic_Music1,
          height: 80,
          width: 80,
          fit: BoxFit.fill,
        ).cornerRadiusWithClipRRect(20).paddingAll(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              text(t11_lbl_song_of_day, fontSize: textSizeLargeMedium, textColor: t11_blackColor, fontFamily: fontMedium).paddingOnly(right: 16),
              text(t11_lbl_SmokeMirrors, textColor: t11_PrimaryColor, fontSize: textSizeNormal, fontFamily: fontMedium).paddingOnly(top: 4, right: 16, bottom: 16),
            ],
          ),
        ),
        Container(
          height: 50,
          width: 50,
          color: t11_PrimaryColor.withOpacity(0.2),
        ).cornerRadiusWithClipRRect(25).paddingAll(16)
      ],
    );

    final songType = Container(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: mList1.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            color: selectedSongType == index ? t11_PrimaryColor : t11_WhiteColor,
            child: text(
              mList1[index].name,
              textColor: selectedSongType == index ? t11_WhiteColor : t11_PrimaryColor,
              fontSize: textSizeLargeMedium,
              fontFamily: fontRegular,
            ).paddingOnly(left: 16, right: 20).center(),
          ).cornerRadiusWithClipRRect(25).paddingOnly(left: 16, right: 8, top: 16, bottom: 16).onTap(() {
            setState(() {
              selectedSongType = index;
            });
          });
        },
      ),
    );

    final songList = Container(
      height: 420,
      child: ListView.builder(
        itemCount: mList2.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 1.5,
                child: CachedNetworkImage(
                  imageUrl: mList2[index].img,
                  fit: BoxFit.fill,
                ).cornerRadiusWithClipRRect(20).paddingTop(16),
              ),
              Container(
                height: 90,
                width: MediaQuery.of(context).size.width / 1.5,
                color: blackColor.withOpacity(0.7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    text(
                      mList2[index].title,
                      textColor: t11_WhiteColor,
                      fontSize: textSizeNormal,
                      fontFamily: fontBold,
                    ),
                    text(mList2[index].subtitle, textColor: t11_WhiteColor, fontSize: textSizeMedium, fontFamily: fontRegular).paddingTop(4),
                  ],
                ).paddingAll(16),
              ).cornerRadiusWithClipRRect(20)
            ],
          ).paddingAll(16);
        },
      ),
    );

    return Scaffold(
      body: Container(
        color: t11_GradientColor2,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30),
              searchView,
              songDetail,
              Divider(height: 25),
              songType,
              songList,
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: selectedIndex == 0 ? whiteColor : whiteColor.withOpacity(0.2),
              size: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              color: selectedIndex == 1 ? whiteColor : whiteColor.withOpacity(0.2),
              size: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CachedNetworkImage(
              imageUrl: t11_ic_Profile,
              height: 35,
              width: 35,
              fit: BoxFit.cover,
            ).cornerRadiusWithClipRRect(10),
            label: '',
          ),
        ],
        onTap: onItemTapped,
        backgroundColor: t11_PrimaryColor,
      ),
    );
  }
}
