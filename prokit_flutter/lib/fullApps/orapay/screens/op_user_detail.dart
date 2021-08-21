import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Colors.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Style.dart';

import 'op_dashboard.dart';

class OPUserDetailsScreen extends StatefulWidget {
  @override
  _OPUserDetailsScreenState createState() => _OPUserDetailsScreenState();
}

class _OPUserDetailsScreenState extends State<OPUserDetailsScreen> {
  PageController pageController = PageController(initialPage: 0);
  int pageNumber = 0;

  List<Widget> buildDotIndicator() {
    List<Widget> list = [];
    for (int i = 0; i <= 3; i++) {
      list.add(i == pageNumber ? indicator(isActive: true) : indicator(isActive: false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: double.infinity,
              child: PageView(
                onPageChanged: (index) => setState(() {
                  pageNumber = index;
                }),
                controller: pageController,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 16, bottom: 70, right: 16, top: size.height * 0.1),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          applogo(),
                          SizedBox(height: 24),
                          Text("Fill your information", style: boldTextStyle(size: 24, letterSpacing: 0.2)),
                          SizedBox(height: 24),
                          textField(title: 'Full name', image: Icons.event_note),
                          SizedBox(height: 16),
                          textField(title: 'username', image: Icons.person_outline),
                          SizedBox(height: 16),
                          textField(title: 'Date of birth', textInputType: TextInputType.datetime, image: Icons.calendar_today),
                          SizedBox(height: 16),
                          textField(title: 'Phone number', image: Icons.phone_iphone),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, bottom: 70, right: 16, top: size.height * 0.1),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          applogo(),
                          SizedBox(height: 24),
                          Text("What'\s your job", style: boldTextStyle(size: 24, letterSpacing: 0.2)),
                          SizedBox(height: 24),
                          textField(title: 'Company name', image: Icons.business),
                          SizedBox(height: 16),
                          textField(title: 'Position', image: Icons.contact_mail),
                          SizedBox(height: 16),
                          textField(title: 'Location', image: Icons.location_on),
                          SizedBox(height: 16),
                          textField(title: 'Start date', image: Icons.calendar_today),
                          SizedBox(height: 16),
                          textField(title: 'Address', image: Icons.home)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, bottom: 70, right: 16, top: size.height * 0.1),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          applogo(),
                          SizedBox(height: 24),
                          Text("Address", style: boldTextStyle(size: 24, letterSpacing: 0.2)),
                          SizedBox(height: 24),
                          textField(title: 'Main address', image: Icons.home),
                          SizedBox(height: 16),
                          textField(title: 'Second address', image: Icons.home),
                          SizedBox(height: 16),
                          textField(title: 'State', image: Icons.business),
                          SizedBox(height: 16),
                          textField(title: 'Post Code', image: Icons.pin_drop),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, bottom: 100, right: 16, top: size.height * 0.05),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          applogo(),
                          SizedBox(height: 24),
                          Text("Pick a way to Verify", style: boldTextStyle(size: 24, letterSpacing: 0.2)),
                          SizedBox(height: 24),
                          VerifyCards(
                            size: size,
                            title: 'Video call',
                            subtitle: 'We will call you shortly',
                            image: 'images/orapay/opvideocall.png',
                            color: Color(0xFFFF6E18),
                          ),
                          SizedBox(height: 20),
                          VerifyCards(
                            size: size,
                            title: 'Outlets',
                            subtitle: 'You came to our outlates',
                            image: 'images/orapay/opoutlets.png',
                            color: Color(0xFF343EDB),
                          ),
                          SizedBox(height: 20),
                          VerifyCards(
                            size: size,
                            title: 'Agents',
                            subtitle: 'Our agents will come to you',
                            image: 'images/orapay/opagent.png',
                            color: Color(0xFF343EDB),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
              padding: EdgeInsets.only(left: 20),
              width: size.width,
              height: 50,
              decoration: BoxDecoration(color: opPrimaryColor, borderRadius: BorderRadius.circular(15.0)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: Text('${pageNumber + 1}', style: primaryTextStyle(size: 16, color: opPrimaryColor)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: buildDotIndicator(),
                  ),
                  pageNumber != 3
                      ? TextButton(
                          onPressed: () {
                            pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
                          },
                          child: Text('Next', style: primaryTextStyle(size: 16, color: opBackgroundColor)),
                        )
                      : TextButton(
                          onPressed: () {
                            finish(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => OPBottomNavigationScreen()));
                          },
                          child: Text('Finish', style: primaryTextStyle(size: 16, color: opBackgroundColor)),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
