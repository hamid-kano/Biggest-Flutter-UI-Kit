import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/Lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class MWSliverAppBarScreen2 extends StatefulWidget {
  static String tag = '/MWSliverAppBarScreen2';

  @override
  _MWSliverAppBarScreen2State createState() => _MWSliverAppBarScreen2State();
}

class _MWSliverAppBarScreen2State extends State<MWSliverAppBarScreen2> {
  var text = lipsum.createText(numParagraphs: 8, numSentences: 5);

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
        headerSliverBuilder: ((BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(
                  imageUrl: "https://images.pexels.com/photos/443356/pexels-photo-443356.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                  fit: BoxFit.cover,
                ),
                collapseMode: CollapseMode.parallax,
                title: Text(
                  'Parallax SliverAppBar',
                  style: boldTextStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ).visible(innerBoxIsScrolled),
              ),
              backgroundColor: appStore.appBarColor,
              leading: BackButton(
                color: innerBoxIsScrolled ? appStore.iconColor : appStore.iconSecondaryColor,
                onPressed: () async {
                  finish(context);
                },
              ),
            ),
          ];
        }),
        body: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(text, textAlign: TextAlign.justify, style: primaryTextStyle()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
