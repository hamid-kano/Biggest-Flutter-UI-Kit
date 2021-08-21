import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/dots_indicator/dots_indicator.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Colors.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Constant.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Images.dart';

import 'Walkthrough.dart';

class IntroScreen extends StatefulWidget {
  final List<Walkthrough> walkthroughList;
  final MaterialPageRoute pageRoute;

  IntroScreen(this.walkthroughList, this.pageRoute);

  void skipPage(BuildContext context) {
    Navigator.push(context, pageRoute);
  }

  @override
  IntroScreenState createState() {
    return new IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == widget.walkthroughList.length - 1) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Observer(
        builder: (_) => Stack(
          children: <Widget>[
            ScrollConfiguration(
              behavior: SBehavior(),
              child: PageView(children: widget.walkthroughList, controller: controller, onPageChanged: _onPageChanged),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  DotsIndicator(
                    dotsCount: 3,
                    position: currentPage,
                    decorator: DotsDecorator(size: const Size.square(5.0), activeSize: const Size.square(8.0), color: t1_view_color, activeColor: t1_colorPrimary),
                  ),
                  SizedBox(height: height * 0.07),
                  Container(
                    decoration: BoxDecoration(color: t1_colorPrimary, shape: BoxShape.circle),
                    child: Text("Skip", style: TextStyle(color: t1_white, fontSize: textSizeSmall)),
                    padding: EdgeInsets.all(24),
                  ),
                  SizedBox(height: 16),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[]),
                  Image.asset(t1_walk_bottom, width: width, height: height * 0.12, fit: BoxFit.fill),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void info() {
  var currentPage;
  switch (currentPage) {
    case 0:
      Container(margin: new EdgeInsets.fromLTRB(0, 0, 30, 0), child: Image.asset(t1_walk_top, width: 40, height: 40, alignment: Alignment.topRight));
      break;
    case 1:
      Image.asset(t1_walk_top, width: 40, height: 40);
      break;
    case 2:
      Container(margin: new EdgeInsets.fromLTRB(30, 0, 0, 0), child: Image.asset(t1_walk_top, width: 40, height: 40));
      break;
  }
}
