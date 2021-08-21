import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/shimmer/shimmer.dart';

class SHomePage extends StatefulWidget {
  static String tag = '/SHomePage';

  @override
  _SHomePageState createState() => _SHomePageState();
}

class _SHomePageState extends State<SHomePage> {
  bool? isActive;

  List<Feeds> feed1 = [
    Feeds(
      profileImg: '$BaseUrl/images/grocery/grocery_ic_user1.png',
      name: 'John Doe',
      feedImage: '$BaseUrl/images/food/food_ic_popular2.jpg',
    ),
    Feeds(
      profileImg: '$BaseUrl/images/grocery/grocery_ic_user2.png',
      name: 'Carry Milton',
      feedImage: '$BaseUrl/images/food/food_ic_popular3.jpg',
    ),
    Feeds(
      profileImg: '$BaseUrl/images/grocery/grocery_ic_user3.png',
      name: 'Jhonny Smith',
      feedImage: '$BaseUrl/images/food/food_ic_popular1.jpg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    isActive = true;
    print(isActive);
    init();
  }

  init() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      isActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Shimmer'),
        body: ListView.builder(
          itemCount: feed1.length,
          itemBuilder: (BuildContext context, int index) {
            return isActive!
                ? SizedBox(
                    child: Shimmer.fromColors(
                      baseColor: appStore.isDarkModeOn ? Colors.black12 : Colors.grey[400],
                      highlightColor: appStore.isDarkModeOn ? Colors.white12 : Colors.grey[100],
                      child: Container(
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black, width: 1.0))),
                        margin: EdgeInsets.only(top: 15),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 15, right: 10),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10),
                                    height: 8,
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                  height: 10,
                                  margin: EdgeInsets.only(right: 10),
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              height: 200,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                    margin: EdgeInsets.only(top: 15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(feed1[index].profileImg!),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(feed1[index].name!, style: primaryTextStyle()),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Icon(Icons.more_vert, color: appStore.iconColor),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                          child: CachedNetworkImage(placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?, imageUrl: feed1[index].feedImage!),
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}

class Feeds {
  String? profileImg;
  String? name;
  String? feedImage;

  Feeds({this.profileImg, this.name, this.feedImage});
}
