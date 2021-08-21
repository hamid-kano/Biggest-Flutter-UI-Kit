import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/model/NBModel.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBDataProviders.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBWidgets.dart';

class NBFollowingScreen extends StatefulWidget {
  static String tag = '/NBFollowingScreen';

  final bool isFollowing;

  NBFollowingScreen({this.isFollowing = false});

  @override
  NBFollowingScreenState createState() => NBFollowingScreenState();
}

class NBFollowingScreenState extends State<NBFollowingScreen> {
  List<NBFollowersItemModel> followersList = nbGetFollowers();

  TextEditingController searchController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: nbAppBarWidget(context, title: widget.isFollowing ? 'Following' : 'Followers'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.height,
            AppTextField(
              controller: searchController,
              textFieldType: TextFieldType.OTHER,
              decoration: nbInputDecoration(
                context,
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            16.height,
            ListView.separated(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('${followersList[index].image}'),
                      radius: 30,
                    ),
                    trailing: AppButton(
                      text: widget.isFollowing ? 'Following' : 'Follow',
                      color: widget.isFollowing ? grey.withOpacity(0.1) : black,
                      textColor: widget.isFollowing ? grey : white,
                      onTap: () {},
                      elevation: 0,
                    ).cornerRadiusWithClipRRect(16),
                    title: Text(
                      '${followersList[index].name}',
                      style: boldTextStyle(),
                    ),
                    subtitle: Text('${followersList[index].noOfArticle} Articles', style: secondaryTextStyle()),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: followersList.length),
            16.height,
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
