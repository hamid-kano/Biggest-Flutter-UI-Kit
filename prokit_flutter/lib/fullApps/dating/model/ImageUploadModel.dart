import 'dart:io';

class ImageUploadModel {
  bool? isUploaded;
  bool? uploading;
  String? imageUrl;
  File? imageFile;

  ImageUploadModel({this.isUploaded, this.uploading, this.imageUrl,this.imageFile});
}
