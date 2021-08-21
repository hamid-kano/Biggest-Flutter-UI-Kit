import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'TinderCard.dart';

class TinderHomePage extends StatefulWidget {
  static String tag = '/TinderHomePage';

  @override
  _TinderHomePageState createState() => _TinderHomePageState();
}

class _TinderHomePageState extends State<TinderHomePage> {
  bool isActive = false;

  //  Use this to trigger swap. (i.e to swipe the card to left or right)
  CardController controller = CardController();

  //  List is used to show data in the card.
  List<UserDetails> user = [
    UserDetails(name: 'Barkha Singh', image: 'https://wallpapercave.com/wp/wp4636827.jpg', age: 20, city: 'Navsari'),
    UserDetails(
        name: 'Mithali Parkar',
        image: 'https://2.bp.blogspot.com/-_mKKdFGGd-Y/WxEULk2hqxI/AAAAAAAAOFo/pirHeoRRakArw4aFJzkWUVmygr86V69bACLcBGAs/s1600/actress-mithila-palkar-photos-18.jpg',
        age: 27,
        city: 'Mumbai'),
    UserDetails(name: 'Ayush Mehra ', image: 'https://i2.wp.com/wikifamouspeople.com/wp-content/uploads/2019/02/Ayush-Mehra.jpg?resize=1060%2C794&ssl=1', age: 27, city: 'Mumbai'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, 'Tinder card'),
      body: isActive == false
          ? Container(
              height: size.height,
              child: TinderSwapCard(
                // orientation where you want to show the stack
                orientation: AmassOrientation.RIGHT,
                // total number of cards
                totalNum: user.length,
                // from which index you want to show the card
                currentIndex: 1,
                // no of stacks you want to show in background
                stackNum: 3,
                // set the max and min width
                maxWidth: size.width * .9,
                maxHeight: size.height * 0.8,
                minWidth: size.width * 0.8,
                minHeight: size.height * 0.7,
                cardController: controller,
                // Restrict the stack from swiping downside if its false
                swipeDown: false,
                // Restrict the stack from swiping upside if its false
                swipeUp: false,
                swipeUpdateCallback: (DragUpdateDetails? details, Alignment? align) {
                  //  Get swiping card's alignment.
                  print(details!.localPosition);
                  if (align!.x < 0) {
                    //  card is LEFT swiping.
                  } else if (align.x > 0) {
                    //  card is RIGHT swiping
                  }
                },
                swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
                  // Get orientation & index of swiped card!
                  if ((index + 1) == user.length) {
                    setState(() {
                      isActive = true;
                    });
                  }
                },
                cardBuilder: (BuildContext context, int index) {
                  // Customize you card as per your need
                  return Stack(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                  image: FadeInImage(
                                    placeholder: Image.asset('images/LikeButton/image/grey.jpg').image,
                                    image: Image.network(user[index].image!).image,
                                  ).image,
                                  fit: BoxFit.cover),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(user[index].name!, style: TextStyle(fontSize: 20, color: Colors.white)),
                                    Container(margin: EdgeInsets.only(left: 10), child: Text(user[index].age.toString(), style: TextStyle(fontSize: 20, color: Colors.white)))
                                  ],
                                ),
                              ),
                              Container(alignment: Alignment.bottomLeft, child: Text(user[index].city!, style: TextStyle(fontSize: 18, color: Colors.white))),
                            ],
                          )),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: InkWell(
                          onTap: () {
                            controller.triggerLeft();
                          },
                          child: Container(
                              height: 65,
                              width: 75,
                              decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                              margin: EdgeInsets.only(bottom: 100, left: 80),
                              child: Icon(Icons.clear, color: Colors.white, size: 50)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            controller.triggerRight();
                          },
                          child: Container(
                            height: 65,
                            width: 75,
                            decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                            margin: EdgeInsets.only(bottom: 100, right: 80),
                            child: Icon(Icons.check, color: Colors.white, size: 40),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ))
          : Container(
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Lottie.asset('images/Tinder/images/empty.json'),
                  SizedBox(height: 30),
                  Text('No Data Found', style: TextStyle(fontSize: 24, color: Color(0xFF757575))),
                ],
              ),
            ),
      floatingActionButton: isActive == true
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  isActive = false;
                });
              },
              child: Icon(
                Icons.refresh,
                color: white,
              ),
            )
          : SizedBox(),
    );
  }
}

class UserDetails {
  String? name;
  String? image;
  int? age;
  String? city;

  UserDetails({
    this.name,
    this.image,
    this.age,
    this.city,
  });
}
