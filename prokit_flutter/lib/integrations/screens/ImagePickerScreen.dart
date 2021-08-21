import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class ImagePickerScreen extends StatefulWidget {
  static String tag = '/ImagePickerScreen';

  @override
  ImagePickerScreenState createState() => ImagePickerScreenState();
}

class ImagePickerScreenState extends State<ImagePickerScreen> {
  PickedFile? pickImage;
  String fileName = '', filePath = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  Future getImage() async {
    pickImage = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickImage != null) {
      fileName = pickImage!.path.split('/').last;
      filePath = pickImage!.path;
      setState(() {});
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, "Image Picker"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("File Name:", style: boldTextStyle(size: 18)), 8.width, if (pickImage != null) Text("$fileName", style: TextStyle(fontSize: 18, color: Colors.black)).expand()],
              ).paddingAll(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("File Path:", style: boldTextStyle(size: 18)), 8.width, if (pickImage != null) Text("$filePath", style: TextStyle(fontSize: 18, color: Colors.black)).expand()],
              ).paddingAll(16),
              if (pickImage != null)
                Container(
                  width: context.width() * 0.9,
                  height: 500,
                  child: Image.file(File(pickImage!.path), fit: BoxFit.cover),
                ).center(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: appColorPrimary,
                ),
                onPressed: () async {
                  await getImage();
                },
                child: Text("Pick Image", style: boldTextStyle(size: 18, color: Colors.white)),
              ).center().paddingAll(16),
            ],
          ),
        ),
      ),
    );
  }
}
