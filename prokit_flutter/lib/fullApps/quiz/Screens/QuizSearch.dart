import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizDetails.dart';
import 'package:prokit_flutter/fullApps/quiz/model/QuizModels.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizConstant.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizDataGenerator.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizWidget.dart';

class QuizSearch extends StatefulWidget {
  static String tag = '/QuizSearch';

  @override
  _QuizSearchState createState() => _QuizSearchState();
}

class _QuizSearchState extends State<QuizSearch> {
  late List<NewQuizModel> mListings;
  var searchCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    mListings = getQuizData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    // ignore: non_constant_identifier_names
    final QuizAll = StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      scrollDirection: Axis.vertical,
      itemCount: mListings.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        changeStatusColor(quiz_app_background);
        return Container(
          color: quiz_white,
          margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: CachedNetworkImage(
                    placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                    imageUrl: mListings[index].quizImage,
                    height: width * 0.4,
                    width: MediaQuery.of(context).size.width / 0.25,
                    fit: BoxFit.cover,
                  )),
              text(mListings[index].quizName, fontSize: textSizeMedium, isLongText: true, fontFamily: fontMedium).paddingOnly(top: 8, left: 16, right: 16, bottom: 8),
              SizedBox(
                height: 8,
              ),
              text(mListings[index].totalQuiz, textColor: quiz_textColorSecondary).paddingOnly(left: 16, right: 16, bottom: 8),
            ],
          ),
        ).cornerRadiusWithClipRRect(16).onTap(() {
          QuizDetails().launch(context);
        });
      },
    );

    changeStatusColor(quiz_app_background);
    return Scaffold(
      backgroundColor: quiz_app_background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              quizTopBar(""),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  controller: searchCont,
                  style: TextStyle(fontSize: textSizeLargeMedium, fontFamily: fontRegular),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                    hintText: quiz_lbl_search,
                    filled: true,
                    fillColor: quiz_white,
                    hintStyle: TextStyle(color: quiz_view_color),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: quiz_app_background, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: quiz_app_background, width: 0.0),
                    ),
                  ),
                ),
              ),
              searchCont.text.length >= 1 ? QuizAll : Container()
            ],
          ),
        ),
      ),
    );
  }
}
