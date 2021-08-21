import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/model/NBModel.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBColors.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBDataProviders.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBImages.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBWidgets.dart';

class NBCommentScreen extends StatefulWidget {
  static String tag = '/NBCommentScreen';

  final NBNewsDetailsModel? newsDetails;

  NBCommentScreen(this.newsDetails);

  @override
  NBCommentScreenState createState() => NBCommentScreenState();
}

class NBCommentScreenState extends State<NBCommentScreen> {
  List<NBCommentItemModel> commentList = nbGetCommentList();

  TextEditingController commentController = TextEditingController();

  DateFormat timeFormat = DateFormat('hh:mm');
  DateFormat dateFormat = DateFormat('MMM dd,yyyy');

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
      appBar: nbAppBarWidget(context, title: 'Comment'),
      body: Stack(
        children: [
          SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                16.height,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.newsDetails!.categoryName!, style: boldTextStyle(color: NBPrimaryColor)),
                        Text(widget.newsDetails!.title!, style: boldTextStyle()),
                      ],
                    ).expand(flex: 2),
                    4.width,
                    Image.asset(widget.newsDetails!.image!, height: 90, fit: BoxFit.fill).cornerRadiusWithClipRRect(16).expand(flex: 1),
                  ],
                ),
                16.height,
                ListView.separated(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(commentList[index].image!),
                          radius: 30,
                        ),
                        16.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${commentList[index].name}', style: boldTextStyle()),
                            4.height,
                            Text('${commentList[index].message}', style: primaryTextStyle()),
                            8.height,
                            Row(
                              children: [
                                Text('${commentList[index].date}', style: secondaryTextStyle(color: grey.withOpacity(0.5))),
                                Text(' ${commentList[index].time}', style: secondaryTextStyle(color: grey.withOpacity(0.5))),
                              ],
                            ),
                          ],
                        ).expand(),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Column(
                      children: [
                        8.height,
                        Divider(),
                        8.height,
                      ],
                    );
                  },
                  itemCount: commentList.length,
                ),
                70.height,
              ],
            ).paddingOnly(left: 16, right: 16),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              children: [
                AppTextField(
                  controller: commentController,
                  textFieldType: TextFieldType.OTHER,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none)),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                  cursorColor: NBPrimaryColor,
                ).expand(),
                Container(
                  height: 60,
                  width: 60,
                  child: Icon(Icons.send, color: white),
                  color: black,
                ).onTap(() {
                  setState(() {
                    if (commentController.text.isNotEmpty) {
                      commentList.add(NBCommentItemModel(
                        image: NBProfileImage,
                        name: 'XYZ',
                        message: commentController.text,
                        date: dateFormat.format(DateTime.now()),
                        time: timeFormat.format(DateTime.now()),
                      ));
                    }
                  });
                  commentController.text = '';
                }),
              ],
            ),
          ),
        ],
      ).withHeight(context.height()),
    );
  }
}
