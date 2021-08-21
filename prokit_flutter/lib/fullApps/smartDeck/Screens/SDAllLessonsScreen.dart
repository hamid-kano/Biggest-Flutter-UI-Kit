import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/percent_indicator/circular_percent_indicator.dart';
import 'package:prokit_flutter/fullApps/smartDeck/ModelClass/SDLessonDetailModel.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDStyle.dart';
import 'package:prokit_flutter/fullApps/smartDeck/Screens/SDLessonsChapterDetailsScreen.dart';
import 'package:prokit_flutter/fullApps/smartDeck/Screens/SDSortScreen.dart';

class SDLessons extends StatefulWidget {
  @override
  _SDLessonsState createState() => _SDLessonsState();
}

class _SDLessonsState extends State<SDLessons> {
  List<SDLessonDetailModel> subject = [
    SDLessonDetailModel(
      image: 'images/smartDeck/images/sdbiology.png',
      subjectName: 'Biology',
      totalChapter: '7 Chapters',
      backgroundImages: 'https://physicsworld.com/wp-content/uploads/2019/09/dna-binary-code-255618778-Shutterstock_ymgerman.jpg',
      status: 0.5,
    ),
    SDLessonDetailModel(
      image: 'images/smartDeck/images/sdmusic.png',
      subjectName: 'Music',
      totalChapter: '17 Chapters',
      status: 1.0,
      backgroundImages:
          'https://us.123rf.com/450wm/9dreamstudio/9dreamstudio1803/9dreamstudio180300671/96741197-work-desk-of-modern-composer-music-notes-near-headphones-on-dark-wooden-background-top-view-.jpg?ver=6',
    ),
    SDLessonDetailModel(
      image: 'images/smartDeck/images/sdruler.png',
      subjectName: 'Math',
      totalChapter: '14 Chapters',
      status: 0.7,
      backgroundImages: 'https://d2c7ipcroan06u.cloudfront.net/wp-content/uploads/2019/07/mathematics-696x364.jpg',
    ),
    SDLessonDetailModel(
      image: 'images/smartDeck/images/sdcomputer.png',
      subjectName: 'Computer',
      totalChapter: '10 Chapters',
      status: 0.2,
      backgroundImages: 'https://previews.123rf.com/images/aleksander1/aleksander11302/aleksander1130200018/18017241-bulb-made-of-computer-subjects-.jpg',
    ),
    SDLessonDetailModel(
      image: 'images/smartDeck/images/sdearth.png',
      subjectName: 'Geography',
      totalChapter: '5 Chapters',
      status: 0.8,
      backgroundImages: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSePqEkOx6meh5aP5W0wRjvqCwDMFrpKyjFQA&usqp=CAU',
    ),
    SDLessonDetailModel(
      image: 'images/smartDeck/images/sddance.png',
      subjectName: 'Dance',
      totalChapter: '9 Chapters',
      status: 0.6,
      backgroundImages: 'https://i.pinimg.com/originals/30/45/9c/30459c328f5f535509d3131f773ab10f.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    changeStatusColor(sdPrimaryColor);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25),
                color: sdPrimaryColor,
                height: 190,
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CloseButton(color: Colors.white),
                      SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.only(left: 16),
                        child: Text('All Lessons', style: boldTextStyle(size: 20, color: Colors.white)),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(left: 16),
                        child: Text('Senior High School - 12th Grade', style: secondaryTextStyle(size: 14, color: Colors.white54)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 190.0 - 40),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: subject.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10),
                        width: double.infinity,
                        decoration: boxDecorations(showShadow: true),
                        child: ListTile(
                          onTap: () {
                            SDLessonsDetScreen(
                              name: subject[index].subjectName,
                              totalChapter: subject[index].totalChapter,
                              backgroundImages: subject[index].backgroundImages,
                            ).launch(context);
                          },
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: Image.asset(subject[index].image!, height: 60, width: 60),
                          ),
                          title: Text(subject[index].subjectName!),
                          subtitle: Container(margin: EdgeInsets.only(top: 5), child: Text(subject[index].totalChapter!)),
                          trailing: CircularPercentIndicator(
                            radius: 30.0,
                            lineWidth: 3.0,
                            animation: true,
                            percent: subject[index].status!.toDouble(),
                            backgroundColor: sdViewColor,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: sdPrimaryColor,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            SDSortScreen().launch(context);
          },
          label: Text('Sort By', style: boldTextStyle(size: 16, color: Colors.white)),
          icon: Icon(Icons.swap_vert),
        ),
      ),
    );
  }
}
