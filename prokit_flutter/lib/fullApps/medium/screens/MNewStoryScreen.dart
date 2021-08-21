import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';

class MNewStoryScreen extends StatefulWidget {
  static String tag = '/MNewStoryScreen';

  @override
  MNewStoryScreenState createState() => MNewStoryScreenState();
}

class MNewStoryScreenState extends State<MNewStoryScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Publish", style: primaryTextStyle(size: 18, color: Colors.green)),
          ),
        ],
        backgroundColor: black,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            finish(context);
          },
          color: grey,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          TextField(
            style: boldTextStyle(color: white),
            expands: true,
            minLines: null,
            maxLines: null,
            showCursor: true,
            autofocus: true,
            cursorColor: Colors.green,
            decoration: InputDecoration(border: InputBorder.none),
          ).paddingAll(16),
          Positioned(
            bottom: 0,
            child: Container(
              width: context.width(),
              height: 50,
              color: white,
              child: Row(
                children: [
                  IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity(vertical: -4, horizontal: -2),
                      icon: Icon(Icons.text_fields, size: 24, color: grey),
                      onPressed: () {
                        toast("coming soon");
                      }),
                  IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity(vertical: -4, horizontal: -2),
                      icon: Icon(FontAwesome.quote_left, size: 18, color: grey),
                      onPressed: () {
                        toast("coming soon");
                      }),
                  IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity(vertical: -4, horizontal: -2),
                      icon: Icon(Fontisto.nav_icon_list_a, size: 16, color: grey),
                      onPressed: () {
                        toast("coming soon");
                      }),
                  IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity(vertical: -4, horizontal: -2),
                      icon: Icon(Icons.link, size: 28, color: grey),
                      onPressed: () {
                        toast("coming soon");
                      }),
                  IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity(vertical: -4, horizontal: -2),
                      icon: Icon(Entypo.dots_three_horizontal, size: 20, color: grey),
                      onPressed: () {
                        toast("coming soon");
                      }),
                  IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity(vertical: -4, horizontal: -2),
                      icon: Icon(Entypo.email, size: 20, color: grey),
                      onPressed: () {
                        toast("coming soon");
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity(vertical: -4, horizontal: -2),
                          icon: Icon(Icons.image_rounded, size: 24, color: grey),
                          onPressed: () {
                            toast("coming soon");
                          }),
                    ],
                  ).expand(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
