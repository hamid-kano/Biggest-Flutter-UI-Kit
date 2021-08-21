import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/customPaint/card/CardCustomPainter.dart';

class CardScreen extends StatefulWidget {
  @override
  CardScreenState createState() => CardScreenState();
}

class CardScreenState extends State<CardScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget cardAppButton({required BuildContext context, String? post, String? postTitle}) {
    return AppButton(
      child: Column(
        children: [
          Text(post.validate(), style: boldTextStyle()),
          Text(postTitle.validate(), style: secondaryTextStyle()),
        ],
      ),
      color: context.cardColor,
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Card Paint', center: true, color: context.scaffoldBackgroundColor),
      body: Container(
        decoration: boxDecorationDefault(borderRadius: radius(50)),
        width: 300.0,
        height: 400.0,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      "https://images.unsplash.com/photo-1599834562135-b6fc90e642ca?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGZhY2UlMjBwcm9maWxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
                    ).image),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              child: Container(
                child: CustomPaint(
                  painter: CustomContainerShapeBorder(height: 100.0, width: 300.0, radius: 50.0, fillColor: context.cardColor),
                ),
              ),
            ),
            Positioned(
              bottom: 18.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cardAppButton(context: context, post: '45', postTitle: 'Post'),
                  8.width,
                  cardAppButton(context: context, post: '100', postTitle: 'Followers'),
                  8.width,
                  cardAppButton(context: context, post: '50', postTitle: 'Following'),
                ],
              ),
            ),
          ],
        ),
      ).center(),
    );
  }
}
