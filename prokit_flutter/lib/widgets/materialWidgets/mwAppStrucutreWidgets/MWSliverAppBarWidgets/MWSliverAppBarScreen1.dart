import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWSliverAppBarScreen1 extends StatefulWidget {
  static String tag = '/MWSliverAppBarScreen1';

  @override
  _MWSliverAppBarScreen1State createState() => _MWSliverAppBarScreen1State();
}

class _MWSliverAppBarScreen1State extends State<MWSliverAppBarScreen1> {
  @override
  void initState() {
    super.initState();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: IconButton(
                icon: Icon(Icons.filter_1),
                color: appStore.isDarkModeOn
                    ? appStore.iconColor
                    : innerBoxIsScrolled
                        ? blackColor
                        : white,
                onPressed: () {
                  // Do something
                },
              ),
              expandedHeight: 220.0,
              floating: true,
              pinned: true,
              snap: false,
              elevation: 50,
              backgroundColor: appStore.appBarColor,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text('SliverAppBar with ListView', style: primaryTextStyle(color: innerBoxIsScrolled ? appStore.textPrimaryColor : white)),
                  background: CachedNetworkImage(
                    placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                    imageUrl: 'https://images.pexels.com/photos/443356/pexels-photo-443356.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Container(
          child: ListView.builder(
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    'Item ${index.toString()}',
                    style: TextStyle(fontSize: 20.0, color: appStore.textPrimaryColor),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
