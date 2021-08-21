import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/muvi/models/flix_response.dart';
import 'package:prokit_flutter/fullApps/muvi/screens/flix_movie_detail_screen.dart';
import 'package:prokit_flutter/fullApps/muvi/screens/flix_view_all_movies_screen.dart';
import 'package:prokit_flutter/fullApps/muvi/screens/flix_view_movie_screen.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_app_widgets.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_constants.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_data_generator.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_size.dart';

class MyFilesFragment extends StatefulWidget {
  static String tag = '/MyFilesFragment';

  @override
  MyFilesFragmentState createState() => MyFilesFragmentState();
}

class MyFilesFragmentState extends State<MyFilesFragment> {
  List<Movie> popularMovieList = [];
  List<Movie> downloadedMovieList = [];
  List<Movie> mcontinueList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    setState(() {
      popularMovieList.addAll(getMyListMovies());
      mcontinueList.addAll(getContinueMovies());
      downloadedMovieList.addAll(getDownloadedMovies());
    });
  }

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    var myList = ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: popularMovieList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
        itemBuilder: (context, index) {
          return Slidable(
            key: ValueKey(index),
            actionPane: SlidableDrawerActionPane(),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(title: "Action")));
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: spacing_standard_new),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      networkImage(popularMovieList[index].slideImage, aWidth: (width * 0.5) - 42, aHeight: ((width * 0.5) - 42) * (2.5 / 4)).cornerRadiusWithClipRRect(8).paddingRight(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            itemTitle(context, popularMovieList[index].title),
                            itemSubTitle(context, "2019"),
                            itemSubTitle(context, "Action, 18+, Dark, Inspiring, Comedy", colorThird: true, fontsize: ts_medium),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            secondaryActions: <Widget>[
              new IconSlideAction(
                caption: 'Delete',
                color: Color(0xFFE15858),
                icon: Icons.delete_outline,
                onTap: () {},
              ),
            ],
          );
        });
    var myDownloadedList = ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: downloadedMovieList.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
        itemBuilder: (context, index) {
          return Slidable(
            key: ValueKey(index),
            actionPane: SlidableDrawerActionPane(),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MovieScreen()));
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: spacing_standard_new),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      networkImage(downloadedMovieList[index].slideImage, aWidth: (width * 0.5) - 42, aHeight: ((width * 0.5) - 42) * (2.5 / 4)).cornerRadiusWithClipRRect(8).paddingRight(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            itemTitle(context, downloadedMovieList[index].title),
                            itemSubTitle(context, "2019"),
                            itemSubTitle(context, "Action, 18+, Dark, Inspiring, Comedy", colorThird: true, fontsize: ts_medium),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            secondaryActions: <Widget>[
              new IconSlideAction(
                caption: 'Delete',
                color: Color(0xFFE15858),
                icon: Icons.delete_outline,
                onTap: () {},
              ),
            ],
          );
        });
    var continueWatchingList = mcontinueList.isNotEmpty
        ? ItemProgressHorizontalList(
            mcontinueList,
          )
        : Container();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: muvi_appBackground,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: muvi_navigationBackground,
          centerTitle: false,
          title: flixTitle(context),
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 45),
            child: Align(
              alignment: Alignment.topLeft,
              child: TabBar(
                indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                indicatorWeight: 3.0,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: TextStyle(
                  fontFamily: font_medium,
                  fontSize: ts_normal,
                ),
                indicatorColor: muvi_colorPrimary,
                unselectedLabelColor: muvi_textColorPrimary,
                labelColor: muvi_colorPrimary,
                labelPadding: EdgeInsets.only(left: spacing_large, right: spacing_large),
                tabs: [
                  Tab(child: Text("My List")),
                  Tab(child: Text("Downloaded")),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                headingWidViewAll(context, "Continue Watching", () {
                  MaterialPageRoute(builder: (context) => ViewAllMovieScreen(title: "Continue Watching"));
                }).paddingOnly(left: spacing_standard_new, right: spacing_standard_new, top: 12, bottom: spacing_standard_new),
                continueWatchingList,
                myList,
              ],
            ),
          ),
          myDownloadedList,
        ]),
      ),
    );
  }
}
