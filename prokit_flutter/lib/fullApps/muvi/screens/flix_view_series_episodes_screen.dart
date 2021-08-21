import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/muvi/models/flix_response.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_app_widgets.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_constants.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_data_generator.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_size.dart';

// ignore: must_be_immutable
class ViewSeriesEpisodeScreen extends StatefulWidget {
  static String tag = '/ViewSeriesEpisodeScreen';
  String? title = "";

  ViewSeriesEpisodeScreen({this.title});

  @override
  ViewSeriesEpisodeScreenState createState() => ViewSeriesEpisodeScreenState();
}

class ViewSeriesEpisodeScreenState extends State<ViewSeriesEpisodeScreen> {
  List<Movie> episodes = [];

  @override
  void initState() {
    super.initState();
    episodes.addAll(getHorizontalMovie());
    episodes.addAll(getHorizontalMovie());
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    var episodesList = ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: episodes.length,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: spacing_standard_new),
            child: InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
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
                        networkImage(episodes[index].slideImage, aWidth: (width / 2) - 36, aHeight: ((width / 2) - 36) * (2.5 / 4)),
                        Container(
                          decoration: boxDecoration(bgColor: Colors.white.withOpacity(0.8)),
                          padding: EdgeInsets.only(left: spacing_control, right: spacing_control),
                          child: text("EPISODE " + (index + 1).toString(), fontSize: 10, textColor: Colors.black, fontFamily: font_bold),
                        ).paddingAll(spacing_control)
                      ],
                    ),
                  ).paddingRight(spacing_standard),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text("Episode " + (index + 1).toString(), textColor: muvi_textColorPrimary, fontSize: ts_normal),
                        itemSubTitle(context, "S1 E" + (index + 1).toString() + ", 06 Mar 2020", fontsize: ts_medium),
                      ],
                    ),
                  ),
                ],
              ),
              onTap: () {},
              radius: spacing_control,
            ),
          );
        });
    return Scaffold(
      backgroundColor: muvi_appBackground,
      appBar: appBarLayout(context, widget.title),
      body: episodesList,
    );
  }
}
