import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/Lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/model/ListModels.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class IMDismissibleScreen extends StatefulWidget {
  static String tag = '/IMDismissibleScreen';

  @override
  _IMDismissibleScreenState createState() => _IMDismissibleScreenState();
}

class _IMDismissibleScreenState extends State<IMDismissibleScreen> {
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

  List<ListModel> example = [
    ListModel(name: 'Dismissible with Both Side'),
    ListModel(name: 'Dismissible with One Side'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: appStore.scaffoldBackground,
          appBar: appBar(context, 'Dismissible'),
          body: ListView.builder(
              itemCount:  example.length,
              itemBuilder: (BuildContext context, index) {
                return ExampleItemWidget(example[index], onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => example[index].widget!));
                });
              })),
    );
  }
}

Widget mDismissibleList(UserModel mUserModel) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(radius: 20, backgroundColor: appColorPrimary, child: Text(mUserModel.tag!, style: primaryTextStyle(color: Colors.white))),
        10.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  mUserModel.name!,
                  style: boldTextStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  mUserModel.duration!,
                  style: secondaryTextStyle(),
                )
              ],
            ),
            Text(
              lipsum.createParagraph(numSentences: 1),
              style: primaryTextStyle(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            4.height,
            Text(
              lipsum.createParagraph(numSentences: 1),
              style: secondaryTextStyle(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ).expand()
      ],
    ),
  );
}

class UserModel {
  String? tag;
  String? name;
  String? duration;

  UserModel({
    this.tag,
    this.name,
    this.duration,
  });
}

List<UserModel> userList = [
  UserModel(
    tag: 'L',
    name: 'Lee',
    duration: '8:43 am',
  ),
  UserModel(
    tag: 'J',
    name: 'John Smith',
    duration: '2 min ago',
  ),
  UserModel(
    tag: 'P',
    name: 'Paul',
    duration: '2 min ago',
  ),
  UserModel(
    tag: 'D',
    name: 'Dribble',
    duration: '2 min ago',
  ),
  UserModel(
    tag: 'I',
    name: 'Indeed',
    duration: '2 min ago',
  ),
  UserModel(
    tag: 'A',
    name: 'Adward',
    duration: '2 min ago',
  ),
  UserModel(
    tag: 'B',
    name: 'Bella',
    duration: '2 min ago',
  ),
  UserModel(
    tag: 'L',
    name: 'Lee',
    duration: '8:43 am',
  ),
  UserModel(
    tag: 'J',
    name: 'John Smith',
    duration: '2 min ago',
  ),
];
