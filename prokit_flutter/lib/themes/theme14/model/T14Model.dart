import 'package:flutter/cupertino.dart';

class SubscriptionModel {
  String? name;
  String? country;
  String? img;
  int? price;
  Color? backgroundColor;
  Color? bannerColor;
  String? userImg;

  SubscriptionModel({this.name, this.img, this.price, this.backgroundColor, this.bannerColor, this.userImg, this.country});
}

class TravelModel {
  String? img;
  String? name;
  String? lastSeen;
  String? placeImg;
  bool like = false;
  int? totalLike;
  String? placeName;
  String? placeDescription;
  int? totalComment;

  TravelModel({this.img, this.name, this.lastSeen, this.placeImg, this.totalLike, this.placeName, this.placeDescription, this.totalComment});
}

class CheckBoxTextModel {
  String? name;
  bool? checkBox = false;
  String? img;

  CheckBoxTextModel({this.name, this.img});
}

class ChoosePlanModel {
  String? title;
  String? subTitle;
  bool? checkBox = false;

  ChoosePlanModel({this.title, this.subTitle});
}

class MessageListModel {
  String? img;
  String? name;
  String? message;
  String? lastSeen;
  bool? isActive;

  MessageListModel({this.img, this.name, this.message, this.lastSeen, this.isActive});
}

class BHMessageModel {
  int? senderId;
  int? receiverId;
  String? msg;
  String? time;

  BHMessageModel({this.senderId, this.receiverId, this.msg, this.time});
}

class SpendingModel {
  Color? color;
  IconData? icon;
  String? name;
  String? rate;

  SpendingModel({this.color, this.icon, this.name, this.rate});
}

class CardTransactionModel {
  Color? color;
  IconData? icon;
  String? transactionType;
  String? totalTransaction;
  String? rate;
  String? offer;
  double? percentage;

  CardTransactionModel({this.color, this.icon, this.transactionType, this.totalTransaction, this.rate, this.offer, this.percentage});
}

class DateModel {
  int? id;
  String? monthName;
  DateTime? dateTime;

  DateModel({this.id, this.monthName, this.dateTime});
}
