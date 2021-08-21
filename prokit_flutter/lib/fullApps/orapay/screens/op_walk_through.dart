import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Style.dart';

import 'op_login_screen.dart';

class OPWalkThroughScreen extends StatefulWidget {
  static String tag = '/OPWalkThroughScreen';

  @override
  _OPWalkThroughScreenState createState() => _OPWalkThroughScreenState();
}

class _OPWalkThroughScreenState extends State<OPWalkThroughScreen> {
  PageController pageController = PageController(initialPage: 0);
  int pageChanged = 0;
  DateTime? backbuttonpressedTime;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> buildDotIndicator() {
      List<Widget> list = [];
      for (int i = 0; i <= 2; i++) {
        list.add(i == pageChanged ? oPDotIndicator(isActive: true) : oPDotIndicator(isActive: false));
      }

      return list;
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: PageView(
                  onPageChanged: (index) {
                    setState(() {
                      pageChanged = index;
                    });
                  },
                  controller: pageController,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          child: Container(
                            height: context.height() * 0.5,
                            padding: EdgeInsets.only(top: 16),
                            alignment: Alignment.topRight,
                            child: Image(
                              image: AssetImage("images/orapay/opslider1.png"),
                            ),
                          ),
                          height: size.height * 0.5,
                        ),
                        Positioned(
                          top: size.height / 1.8,
                          left: 24,
                          right: 24,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Easy Register", textAlign: TextAlign.center, style: boldTextStyle(size: 20)),
                              SizedBox(height: 16.0),
                              Text("A Discount Toner Carditge is Better than Ever Linuum", textAlign: TextAlign.center, style: secondaryTextStyle(size: 18))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: context.height() * 0.5,
                          child: Image(
                            image: AssetImage("images/orapay/opslider2.png"),
                          ),
                        ),
                        Positioned(
                          top: size.height / 1.8,
                          left: 24,
                          right: 24,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Pay Everything", textAlign: TextAlign.center, style: boldTextStyle(size: 20)),
                              SizedBox(height: 16.0),
                              Text("A Discount Toner Carditge is Better than Ever Linuum", maxLines: 3, textAlign: TextAlign.center, style: secondaryTextStyle(size: 18))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: context.height() * 0.5,
                          child: Image(
                            image: AssetImage("images/orapay/opslider3.png"),
                          ),
                        ),
                        Positioned(
                          top: size.height / 1.8,
                          left: 24,
                          right: 24,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Let\'s Go", textAlign: TextAlign.center, style: boldTextStyle(size: 20)),
                              SizedBox(height: 16.0),
                              Text("A Discount Toner Carditge is Better than Ever Linuum", textAlign: TextAlign.center, style: secondaryTextStyle(size: 18))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  pageChanged == 0
                      ? Expanded(
                          child: SizedBox(),
                          flex: 1,
                        )
                      : Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            child: SliderButton(
                              color: Color(0xFFFF6E18),
                              title: 'Back',
                              onPressed: () {
                                pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInCirc);
                              },
                            ),
                          ),
                        ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: buildDotIndicator(),
                    ),
                  ),
                  pageChanged != 2
                      ? Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: 20,
                            ),
                            child: SliderButton(
                              color: Color(0xFF343EDB),
                              title: 'Next',
                              onPressed: () {
                                pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.easeInCirc);
                              },
                            ),
                          ),
                        )
                      : Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: 20,
                            ),
                            child: SliderButton(
                              color: Color(0xFF343EDB),
                              title: 'Login',
                              onPressed: () {
                                finish(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OPLoginScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
