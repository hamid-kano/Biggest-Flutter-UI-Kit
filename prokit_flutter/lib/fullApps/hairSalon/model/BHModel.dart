import 'package:flutter/material.dart';

class BHBestSpecialModel {
  String? title;
  String? subTitle;
  String? img;

  BHBestSpecialModel({this.title, this.subTitle, this.img});
}

class BHCallModel {
  String? img;
  String? name;
  IconData? callImg;
  String? callStatus;
  String? videoCallIcon;
  String? audioCallIcon;

  BHCallModel({this.img, this.name, this.callImg, this.callStatus, this.videoCallIcon, this.audioCallIcon});
}

class BHCategoryModel {
  String? img;
  String? categoryName;

  BHCategoryModel({this.img, this.categoryName});
}

class BHGalleryModel {
  String? img;

  BHGalleryModel({this.img});
}

class BHHairStyleModel {
  String? img;
  String? name;

  BHHairStyleModel({this.img, this.name});
}

class BHIncludeServiceModel {
  String? serviceImg;
  String? serviceName;
  String? time;
  int? price;

  BHIncludeServiceModel({this.serviceImg, this.serviceName, this.time, this.price});
}

class BHMakeUpModel {
  String? img;
  String? name;

  BHMakeUpModel({this.img, this.name});
}

class MessageModel {
  String? img;
  String? name;
  String? message;
  String? lastSeen;

  MessageModel({this.img, this.name, this.message, this.lastSeen});
}

class BHNotificationModel {
  String? img;
  String? name;
  String? msg;
  String? status;
  String? callInfo;

  BHNotificationModel({this.img, this.name, this.msg, this.status, this.callInfo});
}

class BHNotifyModel {
  String? img;
  String? name;
  String? address;
  double? rating;
  double? distance;

  BHNotifyModel({this.img, this.name, this.address, this.rating, this.distance});
}

class BHOfferModel {
  String? img;
  String? offerName;
  String? offerDate;
  int? offerOldPrice;
  int? offerNewPrice;

  BHOfferModel({this.img, this.offerName, this.offerDate, this.offerOldPrice, this.offerNewPrice});
}

class BHReviewModel {
  String? img;
  String? name;
  double? rating;

  String? day;
  String? review;

  BHReviewModel({this.img, this.name, this.rating, this.day, this.review});
}

class BHServicesModel {
  String? img;
  String? serviceName;
  String? time;
  int? price;
  int? radioVal;

  BHServicesModel({this.img, this.serviceName, this.time, this.price, this.radioVal});
}

class BHSpecialOfferModel {
  String? img;
  String? title;
  String? subtitle;

  BHSpecialOfferModel({this.img, this.title, this.subtitle});
}

class BHMessageModel {
  int? senderId;
  int? receiverId;
  String? msg;
  String? time;

  BHMessageModel({this.senderId, this.receiverId, this.msg, this.time});
}
