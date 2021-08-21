import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartDeck/ModelClass/SDChatsModel.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/fullApps/smartDeck/Screens/SDChatPageViewScreen.dart';

class SDChatScreen extends StatefulWidget {
  @override
  _SDChatScreenState createState() => _SDChatScreenState();
}

class _SDChatScreenState extends State<SDChatScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late List tabs;
  int _currentIndex = 0;

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();

    tabs = ['Personal', 'Group'];
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController!.addListener(_handleTabControllerTick);
  }

  void _handleTabControllerTick() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  List<SDChatsModel> personalChats = [
    SDChatsModel(
      profileImage: 'https://i.insider.com/5de6dd81fd9db241b00c04d3?width=1100&format=jpeg&auto=webp',
      name: 'Sabella Dinna Paul',
      message: 'Can you help me ?',
      time: '2:11 PM',
      pendingMessages: '8',
    ),
    SDChatsModel(
      profileImage: 'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70',
      name: 'Andy Anthony',
      message: 'All the best for exam',
      time: '1:11 PM',
      pendingMessages: '1',
    ),
    SDChatsModel(
      profileImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTMio5UHQKuvdPkvHD4wLt8lJbf6f4JQCUUQA&usqp=CAU',
      name: 'Sita Rodisa',
      message: 'it\'s cool bro',
      time: '12:11 PM',
      pendingMessages: '5',
    ),
    SDChatsModel(
      profileImage: 'https://miro.medium.com/max/785/0*Ggt-XwliwAO6QURi.jpg',
      name: 'Kevin Liu',
      message: 'Can you help me ?',
      time: '11:11 PM',
    ),
    SDChatsModel(
      profileImage: 'https://www.best4geeks.com/wp-content/uploads/2018/08/21-smart-lady-profile-pic-2.jpg',
      name: 'Bob Julis',
      message: 'me: Okay',
      time: '10:11 PM',
    ),
    SDChatsModel(
      profileImage: 'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/6R0kusgfZmQv1jNcHSL9GU/f4c9517962f99704c3a0df849061b380/linkedIN-profile-FB.jpg',
      name: 'Erwin Jose',
      message: 'Can you help me ?',
      time: '9:11 PM',
    ),
  ];

  List<SDChatsModel> groupChats = [
    SDChatsModel(
      profileImage: 'https://www.best4geeks.com/wp-content/uploads/2018/08/21-smart-lady-profile-pic-2.jpg',
      name: 'English Group',
      message: 'Can you help me ?',
      time: '2:11 PM',
      pendingMessages: '5',
    ),
    SDChatsModel(
      profileImage: 'https://www.best4geeks.com/wp-content/uploads/2018/08/21-smart-lady-profile-pic-2.jpg',
      name: 'Revision Group',
      message: 'Can you help me ?',
      time: '1:11 PM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 15, left: 25),
                height: 50,
                width: size.width,
                color: sdPrimaryColor,
                child: Text('Chatroom', style: primaryTextStyle(color: Colors.white)),
              ),
              Column(
                children: <Widget>[
                  Container(
                    color: sdPrimaryColor,
                    child: TabBar(
                      indicatorColor: Colors.white,
                      labelColor: Colors.white,
                      indicatorWeight: 4.0,
                      labelStyle: boldTextStyle(size: 14),
                      unselectedLabelColor: Colors.white.withOpacity(.5),
                      controller: _tabController,
                      tabs: tabs.map((e) => Tab(text: e)).toList(),
                    ),
                  ),
                  if (_currentIndex == 0)
                    ListView.builder(
                        itemCount: personalChats.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: <Widget>[
                              Expanded(
                                child: ListTile(
                                  leading: CircleAvatar(radius: 20, backgroundImage: NetworkImage(personalChats[index].profileImage!)),
                                  title: Text(personalChats[index].name!, style: boldTextStyle(size: 16, color: Colors.black.withOpacity(0.8))),
                                  subtitle: Text(personalChats[index].message!, maxLines: 1, overflow: TextOverflow.ellipsis, style: secondaryTextStyle(size: 12)),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(personalChats[index].time!, style: TextStyle(fontSize: 12)),
                                      personalChats[index].pendingMessages != null
                                          ? Container(
                                              margin: const EdgeInsets.only(top: 5.0),
                                              height: 22,
                                              width: 22,
                                              decoration: BoxDecoration(color: sdSecondaryColorRed, borderRadius: BorderRadius.all(Radius.circular(25.0))),
                                              child: Center(
                                                child: Text(personalChats[index].pendingMessages!, style: primaryTextStyle(size: 11, color: Colors.white)),
                                              ),
                                            )
                                          : SizedBox(),
                                    ],
                                  ),
                                  onTap: () {
                                    SDChatPageViewScreen(
                                      name: personalChats[index].name,
                                      profileImages: personalChats[index].profileImage,
                                    ).launch(context);
                                  },
                                ),
                              )
                            ],
                          );
                        })
                  else if (_currentIndex == 1)
                    ListView.builder(
                      itemCount: groupChats.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: <Widget>[
                            Expanded(
                              flex: 10,
                              child: ListTile(
                                leading: CircleAvatar(radius: 20, backgroundImage: NetworkImage(groupChats[index].profileImage!)),
                                title: Text(groupChats[index].name!, style: boldTextStyle(size: 16, color: Colors.black.withOpacity(0.8))),
                                subtitle: Text(groupChats[index].message!, maxLines: 1, overflow: TextOverflow.ellipsis, style: secondaryTextStyle(size: 12)),
                                trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(groupChats[index].time!, style: TextStyle(fontSize: 12)),
                                    groupChats[index].pendingMessages != null
                                        ? Container(
                                            margin: const EdgeInsets.only(top: 5.0),
                                            height: 22,
                                            width: 22,
                                            decoration: BoxDecoration(
                                              color: sdSecondaryColorRed,
                                              borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                            ),
                                            child: Center(
                                              child: Text(groupChats[index].pendingMessages!, style: primaryTextStyle(size: 11, color: Colors.white)),
                                            ),
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                                onTap: () {
                                  SDChatPageViewScreen(
                                    name: groupChats[index].name,
                                    profileImages: groupChats[index].profileImage,
                                  ).launch(context);
                                },
                              ),
                            )
                          ],
                        );
                      },
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
