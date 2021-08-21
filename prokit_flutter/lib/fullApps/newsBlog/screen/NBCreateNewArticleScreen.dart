import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBCategoryScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBColors.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBDottedBorder.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBWidgets.dart';

class NBCreateNewArticleScreen extends StatefulWidget {
  static String tag = '/NBCreateNewArticleScreen';

  @override
  NBCreateNewArticleScreenState createState() => NBCreateNewArticleScreenState();
}

class NBCreateNewArticleScreenState extends State<NBCreateNewArticleScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController articleController = TextEditingController();

  bool isAudioArticle = false;

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
      appBar: nbAppBarWidget(context, title: 'Create New Article'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            16.height,
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(8.0),
              child: Container(
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.image_outlined),
                    SizedBox(width: 8),
                    Text(
                      'Add Article Cover',
                      style: boldTextStyle(),
                    )
                  ],
                ),
              ),
            ),
            16.height,
            Text(
              'Title',
              style: boldTextStyle(),
            ),
            8.height,
            nbAppTextFieldWidget(titleController, 'Write a Title', TextFieldType.OTHER),
            16.height,
            Text(
              'Write Article',
              style: boldTextStyle(),
            ),
            8.height,
            TextFormField(
              maxLines: 8,
              keyboardType: TextInputType.multiline,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                filled: true,
                fillColor: grey.withOpacity(0.1),
                hintText: 'Write Something here',
                hintStyle: secondaryTextStyle(),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              ),
            ),
            16.height,
            Text(
              'Categories',
              style: boldTextStyle(),
            ),
            8.height,
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: grey.withOpacity(0.1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Categories',
                    style: boldTextStyle(),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  ).onTap(() {
                    NBCategoryScreen().launch(context);
                  }),
                ],
              ),
            ),
            16.height,
            SwitchListTile(
              value: isAudioArticle,
              activeColor: NBPrimaryColor,
              onChanged: (value) {
                setState(() {
                  isAudioArticle = value;
                });
              },
              title: Text('Audio Article', style: boldTextStyle()),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.all(0),
            ),
            16.height,
            nbAppButtonWidget(context, 'Publish', () {
              finish(context);
            }),
            16.height,
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
