import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/models/follower_model.dart';
import 'package:prokit_flutter/integrations/network/rest_apis.dart';
import 'package:prokit_flutter/integrations/utils/common.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GETMethodExampleScreen extends StatefulWidget {
  static String tag = '/GETMethodExampleScreen';

  @override
  GETMethodExampleScreenState createState() => GETMethodExampleScreenState();
}

class GETMethodExampleScreenState extends State<GETMethodExampleScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget followerList(List<FollowerModel> data) {
      return ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(8, 8, 8, 70),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor!),
            child: Row(
              children: [
                networkImage(data[index].avatar_url, fit: BoxFit.fill, aWidth: 60, aHeight: 60).cornerRadiusWithClipRRect(50),
                10.width,
                Text(data[index].login!, style: boldTextStyle()),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: appBar(context, 'GET method'),
      body: FutureBuilder<List<FollowerModel>>(
        future: getFollowers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text(snapshot.error as String).center();
          if (snapshot.hasData) return followerList(snapshot.data!);
          return loadingWidgetMaker().center();
        },
      ),
    );
  }
}
