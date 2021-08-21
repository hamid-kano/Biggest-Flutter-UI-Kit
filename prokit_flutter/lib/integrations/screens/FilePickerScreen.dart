import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class FilePickerScreen extends StatefulWidget {
  static String tag = '/FilePickerScreen';

  @override
  FilePickerScreenState createState() => FilePickerScreenState();
}

class FilePickerScreenState extends State<FilePickerScreen> {
  File? file;
  String fileName = '', filePath = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  Future getFiles() async {
    FilePickerResult? _result = await FilePicker.platform.pickFiles(type: FileType.any);

    if (_result != null) {
      file = File(_result.files.single.path!);
      fileName = file!.path.split('/').last;
      filePath = file!.path;
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "File Picker"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("File Name:", style: boldTextStyle(size: 18)), 8.width, if (file != null) Text("$fileName", style: primaryTextStyle()).expand()],
          ).paddingAll(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("File Path:", style: boldTextStyle(size: 18)), 8.width, if (file != null) Text("$filePath", style: primaryTextStyle()).expand()],
          ).paddingAll(16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: appColorPrimary,
            ),
            onPressed: () async {
              await getFiles();
              setState(() {});
            },
            child: Text("Pick File", style: boldTextStyle(color: Colors.white, size: 18)),
          ).paddingOnly(left: 16).center(),
        ],
      ),
    );
  }
}
