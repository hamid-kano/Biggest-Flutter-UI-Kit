import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartDeck/ModelClass/SDLessonsDetailsModel.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/fullApps/smartDeck/Screens/SDLessonChapterScreen.dart';

// ignore: must_be_immutable
class SDLessonsDetScreen extends StatefulWidget {
  String? name;
  String? totalChapter;
  String? backgroundImages;

  SDLessonsDetScreen({this.name, this.totalChapter, this.backgroundImages});

  @override
  _SDLessonsDetScreenState createState() => _SDLessonsDetScreenState();
}

class _SDLessonsDetScreenState extends State<SDLessonsDetScreen> {
  List<SDLessonsDetailsModel> chapters = [
    SDLessonsDetailsModel(chapterName: 'Introduction', chapterDetails: 'Introduction to geography', score: '81'),
    SDLessonsDetailsModel(chapterName: 'Maps type & Usages', chapterDetails: 'Learn about maps type & how to use each...', score: '79'),
    SDLessonsDetailsModel(chapterName: 'Population & Country', chapterDetails: 'Learn the worldwide population & country...', score: '80'),
    SDLessonsDetailsModel(chapterName: 'Climate ', chapterDetails: 'Learn about climate...', score: '60'),
    SDLessonsDetailsModel(chapterName: 'Earth-forming Process ', chapterDetails: 'Learn how the earth-forming process be...', score: '56'),
    SDLessonsDetailsModel(chapterName: 'Rocks', chapterDetails: 'Learn the type of the rocks,and their spec...', score: '90'),
    SDLessonsDetailsModel(chapterName: 'Earthquake', chapterDetails: 'Learn about seismology...', score: '90'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 270,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: widget.backgroundImages == null
                              ? NetworkImage("https://d2rdhxfof4qmbb.cloudfront.net/wp-content/uploads/20190816134243/Desert-sand-sunset.jpg")
                              : NetworkImage(widget.backgroundImages!),
                          fit: BoxFit.cover),
                    ),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          padding: EdgeInsets.only(top: 22, left: 20),
                          width: size.width,
                          color: Colors.grey.withOpacity(0.1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(radius: 20, backgroundColor: Colors.black12, child: CloseButton()),
                              Container(
                                margin: EdgeInsets.only(top: 100),
                                child: Text(widget.name == null ? 'Biology' : widget.name!, style: boldTextStyle(color: Colors.white)),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(widget.totalChapter == null ? '7 chapter' : widget.totalChapter!, style: secondaryTextStyle(color: Colors.white.withOpacity(0.8))),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            top: 25,
                                            child: CircleAvatar(radius: 5, foregroundColor: Colors.white, backgroundColor: Colors.green),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(top: 0),
                                            child: Text('Erwin Jose', style: boldTextStyle(size: 16, color: Colors.white)),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 5),
                                            child: Text('Teacher', style: secondaryTextStyle(size: 10, color: Colors.white)),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: 150,
                    bottom: -40,
                    child: Container(
                      height: 170,
                      width: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(
                            widget.backgroundImages == null ? "https://d2rdhxfof4qmbb.cloudfront.net/wp-content/uploads/20190816134243/Desert-sand-sunset.jpg" : widget.backgroundImages!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 35, left: 15, right: 15),
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text('Select Chapter', style: secondaryTextStyle()),
                    ),
                    ListView.builder(
                      itemCount: chapters.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            SDLessonsDetailsScreen().launch(context);
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(chapters[index].chapterName!, style: boldTextStyle(size: 16)),
                                    Container(
                                      margin: EdgeInsets.only(top: 8, bottom: 5),
                                      child: Text(chapters[index].chapterDetails!, style: secondaryTextStyle(size: 12)),
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: sdSecondaryColorGreen.withOpacity(0.7),
                                  child: Text(chapters[index].score!, style: boldTextStyle(color: CupertinoColors.white, size: 16)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
