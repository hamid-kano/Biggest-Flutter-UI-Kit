import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class MWAppBarScreen extends StatefulWidget {
  static String tag = '/MWAppBarScreen';

  @override
  MWAppBarScreenState createState() => MWAppBarScreenState();
}

class MWAppBarScreenState extends State<MWAppBarScreen> {
  FocusNode focusNode = FocusNode();

  bool isSearching = false;
  Widget appBarTitle = Text("Search Toolbar", style: boldTextStyle(color: appStore.textPrimaryColor));

  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.white,
  );

  //
  @override
  void initState() {
    super.initState();
    isSearching = false;
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget leadingWidget() {
      return BackButton(
        onPressed: () {
          toast('Back button');
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'AppBar'),
        body: Container(
          padding: EdgeInsets.only(top: 16, bottom: 16),
          child: SingleChildScrollView(
            child: Wrap(
              runSpacing: 16,
              spacing: 8,
              direction: Axis.horizontal,
              children: [
                // Simple AppBar without actions and back button
                AppBar(
                  title: Text('Without Back Button & Actions', style: boldTextStyle(color: appStore.textPrimaryColor)),
                  backgroundColor: appStore.appBarColor,
                  automaticallyImplyLeading: false,
                ),
                AppBar(
                  title: Text('Center Title', style: boldTextStyle(color: appStore.textPrimaryColor)),
                  // Center the title in AppBar with setting center title property to true.
                  centerTitle: true,
                  backgroundColor: appStore.appBarColor,
                  leading: leadingWidget(),
                ),
                AppBar(
                  leading: leadingWidget(),
                  title: Text('With Back Button', style: boldTextStyle(color: appStore.textPrimaryColor)),
                  backgroundColor: appStore.appBarColor,
                ),
                AppBar(
                  title: Text('With Single Action', style: boldTextStyle(color: appStore.textPrimaryColor)),
                  leading: leadingWidget(),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.settings, color: appStore.textPrimaryColor),
                      onPressed: () {
                        toast('Settings');
                      },
                    )
                  ],
                  backgroundColor: appStore.appBarColor,
                ),
                AppBar(
                  title: appBarTitle,
                  leading: leadingWidget(),
                  actions: [
                    IconButton(
                      icon: Icon(actionIcon.icon, color: appStore.textPrimaryColor),
                      onPressed: () {
                        if (this.actionIcon.icon == Icons.search) {
                          this.actionIcon = Icon(Icons.close, color: appStore.textPrimaryColor);
                          this.appBarTitle = TextField(
                            focusNode: focusNode,
                            onChanged: (value) {
                              setState(() {});
                            },
                            style: TextStyle(color: appStore.textPrimaryColor, fontSize: 20),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.search, color: appStore.textPrimaryColor),
                              hintText: "Search",
                              hintStyle: TextStyle(color: appStore.textPrimaryColor, fontWeight: FontWeight.normal),
                            ),
                          );
                          setState(() {
                            isSearching = true;
                          });
                        } else {
                          setState(() {
                            this.actionIcon = Icon(Icons.search, color: appStore.textPrimaryColor);
                            this.appBarTitle = Text("Search Toolbar", style: boldTextStyle(color: appStore.textPrimaryColor));
                            isSearching = false;
                          });
                        }
                        FocusScope.of(context).requestFocus(focusNode);
                      },
                    ),
                  ],
                  backgroundColor: appStore.appBarColor,
                ),
                AppBar(
                  backgroundColor: appStore.appBarColor,
                  leading: IconButton(
                    icon: Icon(Icons.menu, color: appStore.textPrimaryColor),
                    onPressed: () {
                      toast('Drawer');
                    },
                  ),
                  title: Text('Page Title', style: boldTextStyle(color: appStore.textPrimaryColor)),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.share, color: appStore.textPrimaryColor),
                      onPressed: () {
                        toast('Share');
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.search, color: appStore.textPrimaryColor),
                      onPressed: () {
                        toast('Search');
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert, color: appStore.textPrimaryColor),
                      onPressed: () {
                        toast('Menu');
                      },
                    ),
                  ],
                ),
                AppBar(
                  leading: leadingWidget(),
                  title: Text('With Custom Image', style: boldTextStyle(color: appStore.textPrimaryColor)),
                  backgroundColor: appStore.appBarColor,
                  actions: [
                    IconButton(
                      onPressed: () {
                        toast('Profile');
                      },
                      icon: Image.network('https://tecake.com/wp-content/uploads/2018/07/student-profile-gabriela-mills-college.jpg').cornerRadiusWithClipRRect(20),
                    )
                  ],
                ),
                /*Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Colors.red,
                        Colors.blue,
                      ],
                    ),
                  ),
                  child: AppBar(
                    leading: leadingWidget(),
                    centerTitle: true,
                    title: Text("Gradient Color"),
                    backgroundColor: transparentColor,
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
