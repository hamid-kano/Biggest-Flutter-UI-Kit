import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/smartDeck/ModelClass/SDNotidicationModel.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDColors.dart';

class SDNotificationScreen extends StatefulWidget {
  @override
  _SDNotificationScreenState createState() => _SDNotificationScreenState();
}

class _SDNotificationScreenState extends State<SDNotificationScreen> {
  List<SDNotidicationModel> notification = [
    SDNotidicationModel(
      images: 'https://content.presspage.com/uploads/1369/nehacrop2.jpg?10000',
      notificationmessage: 'Sabeela sends a new message',
      time: '2 min ago',
      dot: true,
    ),
    SDNotidicationModel(
      images: 'images/smartDeck/images/sdsuccess.png',
      notificationmessage: 'Buy ₹50 Credit success',
      time: '2 min ago',
      dot: true,
    ),
    SDNotidicationModel(
      images: 'images/smartDeck/images/sdupdate.png',
      notificationmessage: 'New Update Version 2.0',
      time: '2 min ago',
      dot: true,
    ),
    SDNotidicationModel(
      images: 'images/smartDeck/images/sdsuccess.png',
      notificationmessage: 'Upgrade plan success',
      time: '1 hour ago',
      dot: false,
    ),
    SDNotidicationModel(
      images: 'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70',
      notificationmessage: 'Sita sends a new message',
      time: '1 hour ago',
      dot: false,
    ),
    SDNotidicationModel(
      images: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTMio5UHQKuvdPkvHD4wLt8lJbf6f4JQCUUQA&usqp=CAU',
      notificationmessage: 'Andy sends a new message',
      time: '2 hour ago',
      dot: false,
    ),
    SDNotidicationModel(
      images: 'images/smartDeck/images/sdwarning.png',
      notificationmessage: 'You pro account is expiring soon',
      time: '2 days ago',
      dot: false,
    ),
    SDNotidicationModel(
      images: 'images/smartDeck/images/sdsuccess.png',
      notificationmessage: 'Buy ₹100 Credit success',
      time: '2 days ago',
      dot: false,
    ),
    SDNotidicationModel(
      images: 'images/smartDeck/images/sdbell.png',
      notificationmessage: 'Exam Geography today at 2:00 PM',
      time: '3 days ago',
      dot: false,
    )
  ];

  @override
  Widget build(BuildContext context) {
    Widget mPopup() => PopupMenuButton(
          itemBuilder: (context) {
            List<PopupMenuEntry<Object>> list = [];
            list.add(
              PopupMenuItem(child: Text("Mark as read"), value: 1),
            );
            list.add(
              PopupMenuItem(child: Text("Mute Notification"), value: 1),
            );
            list.add(
              PopupMenuItem(child: GestureDetector(onTap: () {}, child: Text("Settings")), value: 1),
            );
            return list;
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.width * 0.1,
            padding: EdgeInsets.all(6),
            child: Icon(Icons.more_vert, color: sdTextPrimaryColor),
          ),
        );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              finish(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: Text('Notification', style: boldTextStyle(size: 20)),
          actions: <Widget>[mPopup()],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
          itemCount: notification.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(left: 4),
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  height: 40,
                  width: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: commonCacheImageWidget(notification[index].images!,  35, width: 10,fit: BoxFit.cover),
                  ),
                ),
                title: Text(notification[index].notificationmessage!, style: boldTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis),
                subtitle: Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(notification[index].time!, style: secondaryTextStyle()),
                ),
                trailing: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: CircleAvatar(
                    radius: notification[index].dot == true ? 4 : 0,
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
