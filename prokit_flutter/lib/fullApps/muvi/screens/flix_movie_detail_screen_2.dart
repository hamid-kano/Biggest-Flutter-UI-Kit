import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/muvi/models/flix_response.dart';
import 'package:prokit_flutter/fullApps/muvi/screens/flix_view_movie_screen.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_app_widgets.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_constants.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_data_generator.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_images.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_size.dart';

// ignore: must_be_immutable
class MovieDetail2Screen extends StatefulWidget {
  static String tag = '/MovieDetail2Screen';
  String? title = "";

  MovieDetail2Screen({this.title});

  @override
  MovieDetail2ScreenState createState() => MovieDetail2ScreenState();
}

class MovieDetail2ScreenState extends State<MovieDetail2Screen> {
  List<Movie> mMovieList = [];
  List<Movie> mMovieOriginalsList = [];
  var trailerVideo;
  var isloaded = false;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getData() async {
    setState(() {
      mMovieList.addAll(getMovie());
      mMovieOriginalsList.addAll(getTrendingOnMovie());
    });
  }

  @override
  Widget build(BuildContext context) {
    var buttons = Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
            child: iconButton(context, "play", ic_play_outlined, () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MovieScreen()));
        }, padding: spacing_standard)
                .paddingRight(spacing_standard)),
        Expanded(
            child: iconButton(context, "My List", ic_add, () {},
                    backgroundColor: muvi_colorPrimary.withOpacity(0.1), buttonTextColor: muvi_colorPrimary, iconColor: muvi_colorPrimary, padding: spacing_standard)
                .paddingLeft(spacing_standard)),
      ],
    ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new);

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: muvi_appBackground,
      body: Stack(
        children: <Widget>[
          NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: width * 16 / 11,
                  floating: false,
                  pinned: true,
                  titleSpacing: 0,
                  leading: InkWell(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Icon(
                        Icons.arrow_back,
                        color: muvi_colorPrimary,
                      ),
                    ),
                    onTap: () {
                      finish(context);
                    },
                    radius: spacing_standard_new,
                  ),
                  backgroundColor: muvi_navigationBackground,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: <Widget>[
                        networkImage("https://assets.iqonic.design/old-themeforest-images/prokit/images/muvi/items/poster_ek42.jpg", aWidth: width, aHeight: width * (16 / 11), fit: BoxFit.cover),
                        Container(
                          child: Column(
                            children: <Widget>[
                              text("The Silence", fontSize: ts_xlarge, textColor: muvi_textColorPrimary, fontFamily: font_bold).paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
                              Row(
                                children: <Widget>[
                                  itemSubTitle(context, "1h 29m"),
                                  Container(
                                    decoration: boxDecoration(color: muvi_textColorSecondary, bgColor: Colors.transparent),
                                    child: text("HD", fontSize: ts_medium_small),
                                    padding: EdgeInsets.only(left: spacing_control_half, right: spacing_control_half, top: 0, bottom: 0),
                                  ).paddingLeft(spacing_control_half)
                                ],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new, top: spacing_control),
                              Row(
                                children: <Widget>[
                                  itemSubTitle(context, "Adventure"),
                                  Container(
                                    color: muvi_colorPrimary,
                                    padding: EdgeInsets.all(spacing_control_half),
                                  ).paddingAll(spacing_control),
                                  itemSubTitle(context, "Romantic"),
                                  Container(
                                    color: muvi_colorPrimary,
                                    padding: EdgeInsets.all(spacing_control_half),
                                  ).paddingAll(spacing_control),
                                  itemSubTitle(context, "Thriller"),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new, top: spacing_control),
                              buttons
                            ],
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          height: width,
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                              gradient: new LinearGradient(colors: [
                            Colors.transparent,
                            muvi_appBackground,
                          ], stops: [
                            0.0,
                            1.0
                          ], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter, tileMode: TileMode.repeated)),
                        )
                      ],
                      alignment: Alignment.bottomLeft,
                    ),
                  ),
                  title: toolBarTitle(context, "The Silence").visible(innerBoxIsScrolled),
                ),
              ];
            },
            body: RefreshIndicator(
              onRefresh: () {
                return getData();
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    itemSubTitle(context,
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."),
                    itemSubTitle(context, "Cast: Kimen Shikla, Stanley Tucci, Miranda Otto", colorThird: true, fontsize: ts_medium),
                    itemSubTitle(context, "Director: John R. Leonetti", colorThird: true, fontsize: ts_medium),
                  ],
                ).paddingAll(spacing_standard_new),
              ),
            ),
          ),
          Center(child: loadingWidgetMaker()).visible(isLoading)
        ],
      ),
    );
  }
}
