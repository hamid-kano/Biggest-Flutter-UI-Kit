import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/muvi/models/flix_response.dart';
import 'package:prokit_flutter/fullApps/muvi/screens/flix_view_all_movies_screen.dart';
import 'package:prokit_flutter/fullApps/muvi/screens/flix_view_movie_screen.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_app_widgets.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_data_generator.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_images.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_size.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class MovieDetailScreen extends StatefulWidget {
  static String tag = '/MovieDetailScreen';
  String? title = "";

  MovieDetailScreen({this.title});

  @override
  MovieDetailScreenState createState() => MovieDetailScreenState();
}

class MovieDetailScreenState extends State<MovieDetailScreen> with WidgetsBindingObserver {
  List<Movie> mMovieList = [];
  List<Movie> mMovieOriginalsList = [];
  var trailerVideo;
  late VideoPlayerController _controller;
  var isloaded = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // These are the callbacks
    if (state == AppLifecycleState.inactive || state == AppLifecycleState.paused || state == AppLifecycleState.detached) {
      setState(() {
        _controller.pause();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    WidgetsBinding.instance!.addObserver(this);

    _controller = VideoPlayerController.network('http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4');

    _controller.addListener(() {
      print("listener");
      if (!_controller.value.isPlaying && !_controller.value.isBuffering) {
        setState(() {
          isloaded = false;
        });
      }
    });
    _controller.setLooping(false);
    _controller.initialize().then((_) => setState(() {
          isloaded = true;
        }));

    Timer(Duration(seconds: 2), () {
      _controller.play();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _controller.dispose();
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
    var moviePoster = AspectRatio(
      aspectRatio: isloaded ? _controller.value.aspectRatio : 16 / 9,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          VideoPlayer(_controller),
          networkImage(
            "https://assets.iqonic.design/old-themeforest-images/prokit/images/muvi/items/poster_ek42.jpg",
            aWidth: double.infinity,
            aHeight: double.infinity,
            fit: BoxFit.cover,
          ).visible(!isloaded),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.play_arrow,
                size: 28,
                color: Colors.white,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  headingText(context, "Watch Movie"),
                  itemTitle(context, "2 hr 30 min"),
                ],
              ).paddingLeft(spacing_standard)
            ],
          ).paddingAll(spacing_standard)
        ],
      ),
    ).paddingAll(spacing_standard_new).onTap(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MovieScreen()));
      setState(() {
        _controller.pause();
        isloaded = false;
      });
    });
    var buttons = Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(child: iconButton(context, "Download", ic_download, () {}, padding: 8.0).paddingRight(spacing_standard)),
        Expanded(
            child: iconButton(context, "My List", ic_add, () {}, padding: 8.0, backgroundColor: muvi_colorPrimary.withOpacity(0.1), buttonTextColor: muvi_colorPrimary, iconColor: muvi_colorPrimary)
                .paddingLeft(spacing_standard)),
      ],
    ).paddingAll(spacing_standard_new);
    var moreMovieList = mMovieList.isNotEmpty
        ? ItemHorizontalList(
            mMovieList,
            isHorizontal: false,
          )
        : Container();
    var originalsMovieList = mMovieOriginalsList.isNotEmpty
        ? ItemHorizontalList(
            mMovieOriginalsList,
            isHorizontal: false,
          )
        : Container();

    return Scaffold(
      backgroundColor: muvi_appBackground,
      appBar: appBarLayout(context, widget.title, darkBackground: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            moviePoster,
            headingText(context, "Man of Steel").paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
            MoreLessText(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
                .paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
            buttons,
            headingWidViewAll(context, "U.S. Action Movies", () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllMovieScreen(title: "U.S. Action Movies")));
            }).paddingOnly(left: spacing_standard_new, right: spacing_standard_new, top: 12, bottom: spacing_standard_new),
            moreMovieList,
            headingWidViewAll(context, "Flix Originals Action", () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllMovieScreen(title: "Flix Originals Action")));
            }).paddingOnly(left: spacing_standard_new, right: spacing_standard_new, top: 12, bottom: spacing_standard_new),
            originalsMovieList.paddingBottom(spacing_standard_new),
          ],
        ),
      ),
    );
  }
}
