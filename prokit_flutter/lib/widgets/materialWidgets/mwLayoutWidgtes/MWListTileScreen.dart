import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWListTileScreen extends StatefulWidget {
  static String tag = '/MWListTileScreen';

  @override
  MWListTileScreenState createState() => MWListTileScreenState();
}

class MWListTileScreenState extends State<MWListTileScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'ListTile'),
        body: ListView.builder(
          itemCount: userList.length,
          shrinkWrap: true,
          padding: EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: appStore.appBarColor,
              margin: EdgeInsets.all(8),
              elevation: 2,
              child: ListTile(
                onTap: () {
                  toast(userList[index].name);
                },
                leading: CircleAvatar(radius: 20, backgroundImage: Image.asset(userList[index].images!).image),
                title: Text(
                  userList[index].name!,
                  style: boldTextStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(userList[index].value!, style: secondaryTextStyle()),
                ),
                trailing: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(Icons.chevron_right, color: appStore.iconColor),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class UserModel {
  String? images;
  String? name;
  String? value;

  UserModel({
    this.images,
    this.name,
    this.value,
  });
}

List<UserModel> userList = [
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user1.png',
    name: 'Lee',
    value: '2 min ago',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user2.png',
    name: 'John Smith',
    value: '2 min ago',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user3.png',
    name: 'Smith',
    value: '1 hour ago',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user1.png',
    name: 'Paul',
    value: '1 hour ago',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user4.png',
    name: 'John Smith',
    value: '1 hour ago',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user5.png',
    name: 'Lee',
    value: '1 day ago',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user2.png',
    name: 'Smith',
    value: '1 day ago',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user1.png',
    name: 'Emene',
    value: '2 min ago',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user2.png',
    name: 'Paul',
    value: '2 min ago',
  ),
  UserModel(
    images: 'images/widgets/materialWidgets/mwLayoutWidgtes/MWListTile/ic_user3.png',
    name: 'Jeck',
    value: '1 hour ago',
  ),
];
