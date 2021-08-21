import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/muvi/models/flix_response.dart';
import 'package:prokit_flutter/fullApps/muvi/screens/flix_view_all_movies_screen.dart';
import 'package:prokit_flutter/fullApps/muvi/screens/flix_view_series_episodes_screen.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_app_widgets.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_constants.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_data_generator.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_duration_formatter.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_images.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_size.dart';
import 'package:video_player/video_player.dart';

class SeriesDetailScreen extends StatefulWidget {
  static String tag = '/SeriesDetailScreen';

  @override
  SeriesDetailScreenState createState() => SeriesDetailScreenState();
}

class SeriesDetailScreenState extends State<SeriesDetailScreen> with WidgetsBindingObserver {
  late VideoPlayerController _controller;
  var isloaded = false;
  bool showOverLay = false;
  bool isFullScreen = false;
  int _currentPosition = 0;
  int _duration = 0;
  bool isBuffering = false;
  List<Movie> actors = [];
  List<Movie> episodes = [];
  List<Movie> mMovieOriginalsList = [];
  var isExpanded = false;

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
    WidgetsBinding.instance!.addObserver(this);
    getData();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _controller = VideoPlayerController.network('http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');
    _attachListenerToController();
    _controller.setLooping(false);
    _controller.initialize().then((_) => setState(() {
          isloaded = true;
        }));
    _controller.play();
  }

  _attachListenerToController() {
    _controller.addListener(
      () {
        isBuffering = _controller.value.isBuffering;
        // ignore: unnecessary_null_comparison
        if (_controller.value.duration == null) {
          return;
        }
        if (mounted) {
          setState(() {
            _currentPosition = _controller.value.duration.inMilliseconds == 0 ? 0 : _controller.value.position.inMilliseconds;
            _duration = _controller.value.duration.inMilliseconds;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    WidgetsBinding.instance!.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    var moviePoster = AspectRatio(
      aspectRatio: isloaded ? _controller.value.aspectRatio : 16 / 9,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          VideoPlayer(_controller),
          Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    showOverLay = !showOverLay;
                    print("showoverlay:" + showOverLay.toString());
                  });
                },
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 50),
                reverseDuration: Duration(milliseconds: 200),
                child: showOverLay
                    ? Container(
                        color: Colors.black38,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    text(durationFormatter(_currentPosition) + " / " + durationFormatter(_duration), textColor: muvi_textColorPrimary).paddingLeft(spacing_standard),
                                    IconButton(
                                      icon: Icon(isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen),
                                      onPressed: () {
                                        setState(() {
                                          !isFullScreen
                                              ? SystemChrome.setPreferredOrientations([
                                                  DeviceOrientation.landscapeRight,
                                                  DeviceOrientation.landscapeLeft,
                                                ])
                                              : SystemChrome.setPreferredOrientations([
                                                  DeviceOrientation.portraitUp,
                                                  DeviceOrientation.portraitDown,
                                                ]);
                                          isFullScreen = !isFullScreen;
                                        });
                                      },
                                    ).visible(!isBuffering)
                                  ],
                                ),
                                VideoProgressIndicator(_controller, allowScrubbing: true),
                              ],
                            ),
                            Center(
                              child: IconButton(
                                icon: Icon(
                                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 56.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _controller.value.isPlaying ? _controller.pause() : _controller.play();
                                    showOverLay = _controller.value.isPlaying ? false : true;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ).onTap(() {
                        setState(() {
                          showOverLay = !showOverLay;
                          print("showoverlay:" + showOverLay.toString());
                        });
                      })
                    : SizedBox.shrink(),
              ),
            ],
          ),
          Center(
            child: loadingWidgetMaker(),
          ).visible(isBuffering)
        ],
      ),
    );
    var actorsList = Container(
      height: 130,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: actors.length,
          itemBuilder: (context, index) {
            return Container(
              width: width * 0.18,
              margin: EdgeInsets.only(left: spacing_standard_new),
              child: Column(
                children: <Widget>[
                  InkWell(
                    radius: width * 0.1,
                    child: CircleAvatar(
                      radius: width * 0.09,
                      backgroundImage: actors[index].slideImage != null ? CachedNetworkImageProvider(actors[index].slideImage!) : CachedNetworkImageProvider(ic_profile),
                    ),
                    onTap: () {},
                  ),
                  text(actors[index].title, textColor: muvi_textColorPrimary, fontFamily: font_medium, maxLine: 2, isCentered: true).paddingOnly(left: spacing_control, right: spacing_control)
                ],
              ),
            );
          }),
    );
    var buttons = Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
            child: IconButton(
                icon: Icon(
                  Icons.thumb_up,
                  size: 24,
                  color: muvi_textColorPrimary,
                ),
                onPressed: () {})),
        Expanded(
            child: IconButton(
          icon: Icon(
            Icons.playlist_add,
            size: 24,
            color: muvi_textColorPrimary,
          ),
          onPressed: () {},
        )),
        Expanded(
            child: IconButton(
          icon: Icon(Icons.cloud_download, size: 24, color: muvi_textColorPrimary),
          onPressed: () {},
        )),
        Expanded(
            child: IconButton(
          icon: Icon(Icons.share, size: 24, color: muvi_textColorPrimary),
          onPressed: () {},
        )),
        Expanded(
            child: IconButton(
          icon: Icon(
            Icons.sentiment_dissatisfied,
            size: 24,
            color: muvi_textColorPrimary,
          ),
          onPressed: () {},
        )),
      ],
    ).paddingOnly();
    var episodesList = Container(
      height: ((width / 2) - 36) * (2.5 / 4) + 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: episodes.length,
          padding: EdgeInsets.only(left: spacing_standard, right: spacing_standard_new),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: spacing_standard),
              width: (width / 2) - 36,
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 4 / 2.5,
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: spacing_control_half,
                          margin: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(spacing_control),
                          ),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: <Widget>[
                              networkImage(episodes[index].slideImage, aWidth: double.infinity, aHeight: double.infinity),
                              Container(
                                decoration: boxDecoration(bgColor: Colors.white.withOpacity(0.8)),
                                padding: EdgeInsets.only(left: spacing_control, right: spacing_control),
                                child: text("EPISODE " + (index + 1).toString(), fontSize: 10.0, textColor: Colors.black, fontFamily: font_medium),
                              ).paddingAll(spacing_control)
                            ],
                          ),
                        ),
                      ),
                    ),
                    text("Episode " + (index + 1).toString(), textColor: muvi_textColorPrimary, fontSize: ts_normal).paddingTop(spacing_control_half),
                    itemSubTitle(context, "S1 E" + (index + 1).toString() + ", 06 Mar 2020", fontsize: ts_medium),
                  ],
                ),
                onTap: () {},
                radius: spacing_control,
              ),
            );
          }),
    );
    var originalsMovieList = mMovieOriginalsList.isNotEmpty
        ? ItemHorizontalList(
            mMovieOriginalsList,
            isHorizontal: false,
          )
        : Container();
    return Scaffold(
      backgroundColor: muvi_appBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Center(child: moviePoster),
              SafeArea(
                child: Container(
                  height: 50,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: muvi_colorPrimary,
                        ),
                        onPressed: () {
                          if (isFullScreen) {
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.portraitUp,
                              DeviceOrientation.portraitDown,
                            ]);
                            isFullScreen = !isFullScreen;
                          } else {
                            finish(context);
                          }
                        },
                      ),
                      toolBarTitle(context, "Jumanji: The Next Level").visible(isFullScreen)
                    ],
                  ),
                ),
              ).visible(showOverLay),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: headingText(
                        context,
                        "Jumanij: The Next Level ",
                      )),
                      IconButton(
                        icon: Icon(!isExpanded ? Icons.arrow_drop_down : Icons.arrow_drop_up),
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ).paddingOnly(
                    left: spacing_standard_new,
                    right: spacing_control_half,
                  ),
                  itemSubTitle(context, "S1 E1, 06 Mar 2020").paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
                  itemSubTitle(context, "Episode 1").paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
                  Container(
                    decoration: boxDecoration(bgColor: muvi_colorPrimary, radius: spacing_control),
                    padding: EdgeInsets.only(left: spacing_standard, right: spacing_standard, top: spacing_control, bottom: spacing_control),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          ic_play_outlined,
                          width: 16,
                          height: 16,
                        ),
                        text("Trailer", fontSize: ts_15, fontFamily: font_medium, textColor: Colors.black).paddingLeft(spacing_standard),
                      ],
                    ),
                  ).paddingAll(spacing_standard_new),
                  actorsList,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      itemSubTitle(context,
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."),
                      itemSubTitle(context, "Cast: Kimen Shikla, Stanley Tucci, Miranda Otto", colorThird: true, fontsize: ts_medium),
                      itemSubTitle(context, "Director: John R. Leonetti", colorThird: true, fontsize: ts_medium),
                    ],
                  ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new).visible(isExpanded),
                  buttons,
                  Divider(
                    thickness: 1,
                    height: 1,
                  ).paddingTop(spacing_standard),
                  headingWidViewAll(context, "Episodes", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewSeriesEpisodeScreen(title: "Episodes")));
                  }).paddingAll(spacing_standard_new),
                  episodesList,
                  headingWidViewAll(context, "Flix Originals Action", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllMovieScreen(title: "Flix Originals Action")));
                  }).paddingOnly(left: spacing_standard_new, right: spacing_standard_new, top: 12, bottom: spacing_standard_new),
                  originalsMovieList.paddingBottom(spacing_standard_new),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void getData() async {
    setState(() {
      actors.addAll(getActors());
      episodes.addAll(getHorizontalMovie());
      mMovieOriginalsList.addAll(getTrendingOnMovie());
    });
  }
}

class PlayPauseOverlay extends StatelessWidget {
  const PlayPauseOverlay({Key? key, this.controller}) : super(key: key);

  final VideoPlayerController? controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller!.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller!.value.isPlaying ? controller!.pause() : controller!.play();
          },
        ),
      ],
    );
  }
}
