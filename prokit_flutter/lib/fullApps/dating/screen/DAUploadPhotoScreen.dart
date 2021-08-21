import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DAIdealScreen.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAColors.dart';

class DAUploadPhotoScreen extends StatefulWidget {
  @override
  DAUploadPhotoScreenState createState() => DAUploadPhotoScreenState();
}

class DAUploadPhotoScreenState extends State<DAUploadPhotoScreen> {
  List<Asset> images = <Asset>[];

  List files = [];

  late List<Asset> resultList;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 4,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      error = error;
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('apes', center: true, titleTextStyle: boldTextStyle(size: 25)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Text('Upload your \nPhoto', style: boldTextStyle(size: 30)),
            16.height,
            Text('Add your best photos', style: primaryTextStyle()),
            16.height,
            images.isNotEmpty
                ? Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 16,
                    spacing: 16,
                    children: List.generate(
                      images.length,
                      (index) {
                        Asset asset = images[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: AssetThumb(
                            asset: asset,
                            height: 200,
                            width: 155,
                          ),
                        );
                      },
                    ),
                  )
                : uploadImage(),
            16.height,
            AppButton(
              width: context.width(),
              color: primaryColor,
              onTap: () {
                finish(context);
                DAIdealScreen().launch(context);
              },
              text: 'Continue',
              textStyle: boldTextStyle(color: white),
            ),
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }

  uploadImage() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: List.generate(
        4,
        (index) {
          return DottedBorderWidget(
            radius: 10,
            padding: EdgeInsets.zero,
            color: primaryColor,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: primaryColor.withOpacity(0.2)),
              height: 200,
              width: context.width() * 0.5 - 24,
              child: IconButton(
                onPressed: () {
                  loadAssets();
                },
                icon: Icon(Icons.add, color: primaryColor),
              ),
            ),
          );
        },
      ),
    );
  }
}
